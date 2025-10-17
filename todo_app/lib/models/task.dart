class Task {
  int? id;
  String title;
  String desc;
  String category;
  String dueDate;
  String priority;
  String status;
  int progress;

  Task({
    this.id,
    required this.title,
    required this.desc,
    required this.category,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.progress,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'desc': desc,
      'category': category,
      'dueDate': dueDate,
      'priority': priority,
      'status': status,
      'progress': progress,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> m) => Task(
    id: m['id'],
    title: m['title'],
    desc: m['desc'],
    category: m['category'],
    dueDate: m['dueDate'],
    priority: m['priority'],
    status: m['status'],
    progress: m['progress'],
  );
}
