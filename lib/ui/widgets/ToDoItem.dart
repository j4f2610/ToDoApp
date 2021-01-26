import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme/dimens.dart';
import 'package:flutter_app/model/ToDo.dart';
import 'package:flutter_app/ui/modules/home/viewmodel/ToDoVM.dart';
import 'package:provider/provider.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final Function onClick;

  ToDoItem({this.todo, this.onClick}) : super();

  @override
  State<StatefulWidget> createState() {
    print('${todo.id}');
    return _ToDoItem();
  }
}

class _ToDoItem extends State<ToDoItem> {

  @override
  Widget build(BuildContext context) {
    var toDoVM = Provider.of<ToDoVM>(context);
    return Card(
      elevation: Dimens.size5,
      child: InkWell(
        splashColor: Colors.black12,
        onTap: () {
          print('Card tapped.');
        },
        child: Row(children: [
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimens.size10,
                        right: Dimens.size10,
                        top: Dimens.size10),
                    child: Text(
                      '${widget.todo.id}',
                      style: TextStyle(fontSize: Dimens.size12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimens.size10),
                    child: Text(
                      '${widget.todo.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Dimens.size15),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimens.size10,
                          right: Dimens.size10,
                          bottom: Dimens.size10),
                      child: Text('${widget.todo.description}')),
                ],
              )),
          Expanded(
            flex: 1,
            child: Switch(
              value: widget.todo.isComplete,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                toDoVM.remove(widget.todo);
              },
            ),
          )
        ]),
      ),
    );
  }
}
