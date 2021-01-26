import 'package:flutter/material.dart';
import 'package:flutter_app/ui/modules/home/viewmodel/ToDoVM.dart';
import 'package:flutter_app/ui/widgets/ToDoListView.dart';
import 'package:provider/provider.dart';

class IncompleteFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IncompleteFragment();
  }
}

class _IncompleteFragment extends State<IncompleteFragment> {
  @override
  Widget build(BuildContext context) {
    var toDoVM = Provider.of<ToDoVM>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ToDoListView(items: toDoVM.getInCompleteList()),
                ),
              ],
            )),
      ),
    );
  }


}
