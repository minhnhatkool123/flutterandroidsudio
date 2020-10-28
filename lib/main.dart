import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterandroidsudio/bloc/bloc_todo.dart';
import 'package:provider/provider.dart';
import 'todo/todo_list_container.dart';
import 'db/todo_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await tododatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('to dolist'),
        ),
        // body: todolistcontainer()
        body: Provider<bloctodo>.value(
          value: bloctodo(),
          child: todolistcontainer(),
        ),
      ),
    );
  }
}
