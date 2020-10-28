import 'dart:async';
import 'dart:math';
import 'package:flutterandroidsudio/base/base_bloc.dart';
import 'package:flutterandroidsudio/base/base_event.dart';
import 'package:flutterandroidsudio/db/todo_table.dart';
import 'package:flutterandroidsudio/event/eventadd.dart';
import 'package:flutterandroidsudio/event/eventdelete.dart';

import '../model/todo.dart';

class bloctodo extends basebloc {
  todotable _todotable = todotable();

  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;
  var _random = Random();
  List<Todo> _todoListData = List<Todo>();

  initData() async {
    _todoListData = await _todotable.selectalltodo();
    if (_todoListData == null) return;
    _todoListStreamController.sink.add(_todoListData);
  }

  _addtodo(Todo todo) async {
    await _todotable.inserttodo(todo);
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deletetodo(Todo todo) async {
    await _todotable.deletetodo(todo);
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispathevent(base_event event) {
    if (event is eventadd) {
      Todo todo = Todo.fromData(_random.nextInt(1000000), event.content);
      _addtodo(todo);
    } else if (event is eventdelete) {
      _deletetodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
