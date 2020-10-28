import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterandroidsudio/todo/todolist.dart';
import 'todohear.dart';

class todolistcontainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          todoheader(),
          Expanded(child: todolist()),
        ],
      ),
    );
  }
}
