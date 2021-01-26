import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/ToDo.dart';

import 'ToDoItem.dart';

class ToDoListView extends StatefulWidget {
  final List<ToDo> items;
  final Function onItemClick;

  const ToDoListView({Key key, this.items, this.onItemClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ToDoListView();
  }
}

class _ToDoListView extends State<ToDoListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) => ToDoItem(
              todo: widget.items[index],
              onClick: () {
                widget.onItemClick();
              },
            ));
  }
}
