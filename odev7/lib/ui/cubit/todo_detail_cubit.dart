import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todos_dao_repo.dart';

class TodoDetailCubit extends Cubit<void> {
  TodoDetailCubit() : super(0);

  var tRepo = ToDosDaoRepository();

  Future<void> updateTodo(int id, String name) async {
    await tRepo.updateTodo(id, name);
  }
}
