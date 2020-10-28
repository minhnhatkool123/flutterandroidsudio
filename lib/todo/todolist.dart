import 'package:flutter/material.dart';
import 'package:flutterandroidsudio/bloc/bloc_todo.dart';
import 'package:flutterandroidsudio/event/eventdelete.dart';
import 'package:flutterandroidsudio/model/todo.dart';
import 'package:provider/provider.dart';

class todolist extends StatefulWidget {
  @override
  _todolistState createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var bloc = Provider.of<bloctodo>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<bloctodo>(
      builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                  itemCount: snapshot.data.length, //đây là kiểu của List todo
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].content),
                      trailing: GestureDetector(
                        onTap: () {
                          bloc.event.add(eventdelete(snapshot.data[index]));
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                        ),
                      ),
                    );
                  });
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: Text(
                    'Empty',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            case ConnectionState.none:
            default:
              return Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      ),
    );
  }
}
