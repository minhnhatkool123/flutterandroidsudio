import 'package:flutter/material.dart';
import 'package:flutterandroidsudio/bloc/bloc_todo.dart';
import 'package:flutterandroidsudio/event/eventadd.dart';
import 'package:provider/provider.dart';

class todoheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txttodocontroller = TextEditingController();
    var bloc = Provider.of<bloctodo>(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: txttodocontroller,
            decoration: InputDecoration(
              labelText: 'add todo test git kol ',
              hintText: 'add todo them nua di',
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        RaisedButton.icon(
          onPressed: () {
            bloc.event.add(eventadd(txttodocontroller.text));
          },
          icon: Icon(Icons.add_box_rounded),
          label: Text('ADD ss'),
        )
      ],
    );
  }
}
