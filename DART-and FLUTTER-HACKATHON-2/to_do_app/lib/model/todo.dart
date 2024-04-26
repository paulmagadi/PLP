class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Excercise. Daily 3', isDone: true ),
      ToDo(id: '02', todoText: 'Call my Mother', isDone: true ),
      ToDo(id: '03', todoText: 'Team Meeting with my Group', ),
      ToDo(id: '04', todoText: 'Work on flutter mobile apps', ),
      ToDo(id: '05', todoText: 'PowerHarks Hackathon', ),
      ToDo(id: '06', todoText: 'Finish My Django Project', ),
    ];
  }
}