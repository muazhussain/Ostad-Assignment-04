class ToDo {
  int? id;
  String? todoText;
  bool isComplete;

  ToDo({required this.id, required this.todoText, this.isComplete = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: 01, todoText: 'Demo', isComplete: false),
    ];
  }
}
