library home_page.dart;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todo_model.dart';
import 'package:odev7/extansions/context_extansions.dart';
import 'package:odev7/theme.dart';
import 'package:odev7/ui/add_todo.dart';
import 'package:odev7/ui/cubit/home_page_cubit.dart';
import 'package:odev7/ui/detail_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchTextVisible = false;
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().getDataTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchTextVisible
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (value) {
                  context.read<HomePageCubit>().search(value);
                },
              )
            : const Text("To Do Application"),
        actions: [
          searchTextVisible
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      searchTextVisible = false;
                    });
                    context.read<HomePageCubit>().getDataTodos();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      searchTextVisible = true;
                    });
                  },
                  icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => AddTodosDialog(),
          ).then((value) => context.read<HomePageCubit>().getDataTodos());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: BlocBuilder<HomePageCubit, List<ToDos>>(builder: (context, todos) {
        return todos.isNotEmpty
            ? ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  Color todoColor = AppColors().todosColors[index % 5];
                  return TodoCard(context, todos[index], todoColor);
                })
            : const Center(
                child: Text("Data Not Found"),
              );
      }),
    );
  }
}

// ignore: non_constant_identifier_names
GestureDetector TodoCard(BuildContext context, ToDos todo, Color color) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => DetailTodoDialog(todo: todo),
      ).then((value) => context.read<HomePageCubit>().getDataTodos());
    },
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.width / 18, vertical: context.width / 50),
      width: context.width / 3,
      height: context.width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              todo.name,
              style: context.todoTitleStyle,
            ),
          ),
          IconButton(
              onPressed: () {
                context.read<HomePageCubit>().deleteTodo(todo.id);
              },
              icon: const Icon(Icons.clear))
        ],
      ),
    ),
  );
}
