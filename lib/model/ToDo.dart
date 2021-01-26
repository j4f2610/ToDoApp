class ToDo {
  final String id = DateTime.now().millisecondsSinceEpoch.toString();
  String title;
  String description;
  bool isComplete = false;
}
