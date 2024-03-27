class Todo {
  String id;
  String todoText;
  bool isDone;

  Todo({required this.id, required this.todoText, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(id: '01', todoText: "Morning exercise", isDone: true),
      Todo(id: '02', todoText: "Wash face and mouth", isDone: true),
      Todo(id: '03', todoText: "Going to market"),
      Todo(id: '04', todoText: "Check Email"),
      Todo(id: '05', todoText: "Complete home task"),
      Todo(id: '06', todoText: "Take breakfast"),
      Todo(id: '07', todoText: "Team meeting"),
      Todo(id: '08', todoText: "Work on mobile apps"),
      Todo(id: '09', todoText: "Take launch"),
      Todo(id: '10', todoText: "Take rest"),
      Todo(id: '11', todoText: "Go to field and play"),
    ];
  }
}
