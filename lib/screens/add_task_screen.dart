import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    int state = Provider.of<TaskData>(context, listen: true).state;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              Provider.of<TaskData>(context, listen: false).displayText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            state == 1
                ? TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newText) {
                      newTaskTitle = newText;
                    },
                  )
                : SizedBox.shrink(),
            state == 2
                ? TextField(
                    enabled: true,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (newText) {
                      newTaskTitle = newText;
                    },
                  )
                : SizedBox.shrink(),
            state == 1
                ? FlatButton(
                    child: Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTaskTitle);
                      Provider.of<TaskData>(context, listen: false).addState();
                      Provider.of<TaskData>(context, listen: false)
                          .setTitle('Set a lower limit price.');
                    },
                  )
                : SizedBox
                    .shrink(), // This will render an empty space with no size
            state == 2
                ? FlatButton(
                    child: Text(
                      'ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .resetState();
                      Provider.of<TaskData>(context, listen: false)
                          .setTitle('Choose one from them.');
                      Navigator.pop(context);
                    },
                  )
                : SizedBox.shrink(), // This w
            state == 0
                ? Column(children: [
                    RadioListTile(
                        title: Text("crypto"),
                        value: 0,
                        groupValue: null,
                        onChanged: (value) {
                          Provider.of<TaskData>(context, listen: false)
                              .addState();
                          Provider.of<TaskData>(context, listen: false)
                              .setTitle('Enter a code.');
                        }),
                    RadioListTile(
                        title: Text("stock"),
                        value: 1,
                        groupValue: null,
                        onChanged: (value) {
                          Provider.of<TaskData>(context, listen: false)
                              .addState();
                          Provider.of<TaskData>(context, listen: false)
                              .setTitle('Enter a code.');
                        }),
                  ])
                : SizedBox
                    .shrink(), // This will render an empty space with no size
          ],
        ),
      ),
    );
  }
}
