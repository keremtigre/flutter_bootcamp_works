import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/repo/todos_dao_repo.dart';

class AddTodoCubit extends Cubit<void> {
  AddTodoCubit() : super(0);
  var krepo = ToDosDaoRepository();

  Future<void> saveTodo(String name) async {
    await krepo.saveTodo(name);
  }
}
