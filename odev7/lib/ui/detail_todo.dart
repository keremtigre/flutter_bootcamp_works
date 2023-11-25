// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todo_model.dart';
import 'package:odev7/ui/cubit/todo_detail_cubit.dart';

class DetailTodoDialog extends StatefulWidget {
  final ToDos todo;

  const DetailTodoDialog({super.key, required this.todo});

  @override
  State<DetailTodoDialog> createState() => _DetailTodoDialogState();
}

class _DetailTodoDialogState extends State<DetailTodoDialog> {
  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfName.text = todo.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Todo Detail"),
      content: TextField(
        controller: tfName,
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
                  .read<TodoDetailCubit>()
                  .updateTodo(widget.todo.id, tfName.text)
                  .then((value) => Navigator.pop(context));
            },
            child: const Text("Update")),
      ],
    );
  }
}
