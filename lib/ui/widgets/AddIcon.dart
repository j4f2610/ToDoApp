import 'package:flutter/material.dart';
import 'package:flutter_app/common/string/StringUtils.dart';
import 'package:flutter_app/ui/modules/home/viewmodel/ToDoVM.dart';

class AddWidget extends StatelessWidget {
  final ToDoVM toDoVM;

  const AddWidget({Key key, this.toDoVM}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: IconButton(
        icon: Icon(Icons.add),
        color: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, StringUtils.NEW_TODO_FRAGMENT, arguments: toDoVM);
        },
      ),
    );
  }
}
