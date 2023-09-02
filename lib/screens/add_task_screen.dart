import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TaskData>(context, listen: true).state;
    String newTaskTitle;
    final TextEditingController _controller = TextEditingController();

    void _clearTextField() {
      _controller.clear();
    }

    Widget buildTaskInput() {
      return TextField(
        controller: _controller,
        autofocus: true,
        textAlign: TextAlign.center,
        onChanged: (newText) {
          newTaskTitle = newText;
        },
      );
    }

    Widget buildOkButton() {
      return FlatButton(
        child: Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.lightBlueAccent,
        onPressed: () {
          Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);

          if (state == 1) {
            Provider.of<TaskData>(context, listen: false).addState();
            Provider.of<TaskData>(context, listen: false)
                .setTitle('Set a lower limit price.');
            _clearTextField();
          } else if (state == 2) {
            Provider.of<TaskData>(context, listen: false).resetState();
            Provider.of<TaskData>(context, listen: false)
                .setTitle('Choose one from them.');
            _clearTextField();
            Navigator.pop(context);
          }
        },
      );
    }

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
            state == 0
                ? Column(
                    children: [
                      RadioListTile(
                        title: Text("Crypto"),
                        value: 0,
                        groupValue: null,
                        onChanged: (value) {
                          Provider.of<TaskData>(context, listen: false)
                              .addState();
                          Provider.of<TaskData>(context, listen: false)
                              .setTitle('Enter a code.');
                        },
                      ),
                      RadioListTile(
                        title: Text("Stock"),
                        value: 1,
                        groupValue: null,
                        onChanged: (value) {
                          Provider.of<TaskData>(context, listen: false)
                              .addState();
                          Provider.of<TaskData>(context, listen: false)
                              .setTitle('Enter a code.');
                        },
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            state == 1 || state == 2 ? buildTaskInput() : SizedBox.shrink(),
            state == 1 || state == 2 ? buildOkButton() : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
