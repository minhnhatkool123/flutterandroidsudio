import 'package:flutterandroidsudio/db/todo_database.dart';
import 'package:flutterandroidsudio/model/todo.dart';
import 'package:sqflite/sqflite.dart';

class todotable {
  static const TABLE_NAME = 'todo';
  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      content TEXT
    );
  ''';
  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> inserttodo(Todo todo) {
    final Database db = tododatabase.instance.database;
    return db.insert(
      TABLE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Todo> deletetodo(Todo todo) async {
    final Database db = tododatabase.instance.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List<Todo>> selectalltodo() async {
    final Database db = tododatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('todo');
    return List.generate(maps.length, (index) {
      return Todo.fromData(
        maps[index]['id'],
        maps[index]['content'],
      );
    });
  }
}
