import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String desc) {
    todos.add(Todo.addTodo(desc: desc));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void removeTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

final todosChangeNotiProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
