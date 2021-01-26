import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/AddIcon.dart';
import 'package:flutter_app/ui/modules/home/CompleteFragment.dart';
import 'package:flutter_app/ui/modules/home/IncompleteFragment.dart';
import 'package:flutter_app/ui/modules/home/ToDoFragment.dart';
import 'package:provider/provider.dart';
import 'viewmodel/ToDoVM.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int mIndex = 0;
  Widget mToDoFragment;
  Widget mIncompleteFragment;
  Widget mCompleteFragment;

  @override
  Widget build(BuildContext context) {
    var toDoVM = Provider.of<ToDoVM>(context);
    var toDos = toDoVM.toDoList;
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo ${toDos.length.toString()}"),
        actions: <Widget>[
          AddWidget(),
        ],
      ),
      body: SafeArea(
        child: getBody(mIndex, toDoVM),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mIndex,
        onTap: (int index) {
          onBottomNavigationBarChange(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Complete',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.clear),
            label: 'Incomplete',
          ),
        ],
      ),
    );
  }

  Widget getBody(int index, ToDoVM toDoVM) {
    switch (index) {
      case 0:
        if (mToDoFragment != null) {
          return mToDoFragment;
        } else {
          return mToDoFragment = ToDoFragment();
        }
        break;
      case 1:
        if (mCompleteFragment != null) {
          return mCompleteFragment;
        } else {
          return mCompleteFragment = CompleteFragment();
        }
        break;
      case 2:
        if (mIncompleteFragment != null) {
          return mIncompleteFragment;
        } else {
          return mIncompleteFragment = IncompleteFragment();
        }
        break;
      default:
        return mToDoFragment = ToDoFragment();
        break;
    }
  }

  void onBottomNavigationBarChange(int index) {
    this.setState(() {
      this.mIndex = index;
    });
  }
}
