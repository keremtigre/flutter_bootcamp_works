import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/add_todo_cubit.dart';

class AddTodosDialog extends StatelessWidget {
  final tfName = TextEditingController();
  AddTodosDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Todo"),
      content: TextField(
        controller: tfName,
        decoration: const InputDecoration(hintText: "Add Todo ..."),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              context
                  .read<AddTodoCubit>()
                  .saveTodo(tfName.text)
                  .then((value) => Navigator.pop(context));
            },
            child: const Text("Add")),
      ],
    );
  }
}
