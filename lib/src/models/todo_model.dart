import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  String id;
  String desc;
  bool isCompleted = false;

  Todo({
    required this.id,
    required this.desc,
    this.isCompleted = false,
  });

  factory Todo.addTodo({required String desc}) {
    return Todo(
      id: uuid.v4(),
      desc: desc,
    );
  }

  @override
  String toString() =>
      'Todo(id: $id, desc: $desc, isCompleted=false: $isCompleted=false)';
}
