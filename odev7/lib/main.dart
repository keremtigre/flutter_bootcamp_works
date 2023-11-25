import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/ui/cubit/add_todo_cubit.dart';
import 'package:odev7/ui/cubit/home_page_cubit.dart';
import 'package:odev7/ui/cubit/todo_detail_cubit.dart';
import 'package:odev7/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        ),
        BlocProvider(
          create: (context) => AddTodoCubit(),
        ),
        BlocProvider(
          create: (context) => TodoDetailCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Roboto",
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
