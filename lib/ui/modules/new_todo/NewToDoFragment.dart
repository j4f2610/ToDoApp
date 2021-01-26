import 'package:flutter/material.dart';
import 'package:flutter_app/model/ToDo.dart';
import 'package:flutter_app/ui/modules/home/viewmodel/ToDoVM.dart';
import 'package:provider/provider.dart';

class NewToDoFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewToDoFragment();
  }
}

class _NewToDoFragment extends State<NewToDoFragment> {
  TextEditingController edtTask = TextEditingController();
  TextEditingController edtDescription = TextEditingController();
  ToDo todo = ToDo();

  @override
  Widget build(BuildContext context) {
    var toDoVM = Provider.of<ToDoVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New To Do Task'),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'What is your task ?',
                    border: OutlineInputBorder(),
                  ),
                  controller: edtTask,
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    controller: edtDescription,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Switch(
                        value: todo.isComplete,
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            this.todo.isComplete = value;
                          });
                        },
                      ),
                      Text(todo.isComplete ? 'Complete' : 'Incomplete'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {
                      todo.title = edtTask.text;
                      todo.description = edtDescription.text;
                      toDoVM.add(todo);
                      Navigator.pop(context);
                    },
                    child: Text('Create Task'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
