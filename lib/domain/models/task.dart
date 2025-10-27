class Task {
  final String id;
  final String? userId;
  final String? title;
  final String? description;
  final bool isCompleted;
  final DateTime? dueDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Task({
    required this.id,
    this.userId,
    this.title,
    this.description,
    this.isCompleted = false,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });

  Task copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'is_completed': isCompleted,
      'due_date': dueDate?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      isCompleted: map['is_completed'] as bool,
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
    );
  }

  get taskId => null;
}
