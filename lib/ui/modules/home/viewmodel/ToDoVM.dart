import 'dart:collection';
import 'package:flutter_app/common/base/BaseVM.dart';
import 'package:flutter_app/model/ToDo.dart';

class ToDoVM extends BaseVM {
  ToDo t = ToDo();
  final List<ToDo> _items = [];

  UnmodifiableListView<ToDo> get toDoList => UnmodifiableListView(_items);

  UnmodifiableListView<ToDo> getCompleteList() {
    return UnmodifiableListView(_items.where((element) => element.isComplete).toList());
  }

  UnmodifiableListView<ToDo> getInCompleteList() {
    return UnmodifiableListView(_items.where((element) => !element.isComplete).toList());
  }

  void add(ToDo item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(ToDo item) {
    _items.remove(item);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
