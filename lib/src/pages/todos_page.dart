import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_change_notifier_provider/src/pages/todos_provider.dart';

import '../utils/ansi_debug.dart';
import '../widgets/add_todo.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final todos = ref.watch(todosChangeNotiProvider);  // TodosNotifier
    final todos = ref.watch(todosChangeNotiProvider).todos; // Todo<List>
    debugPrint(success('### todos: $todos'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: [
          const AddTodo(),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView(
              children: [
                for (final todo in todos)
                  CheckboxListTile(
                    value: todo.isCompleted,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(todo.desc),
                    secondary: IconButton(
                      onPressed: () {
                        ref
                            .read(todosChangeNotiProvider.notifier)
                            .removeTodo(todo.id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onChanged: (value) {
                      ref
                          .read(todosChangeNotiProvider.notifier)
                          .toggleTodo(todo.id);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
