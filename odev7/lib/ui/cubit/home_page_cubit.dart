import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/todo_model.dart';
import 'package:odev7/data/repo/todos_dao_repo.dart';

class HomePageCubit extends Cubit<List<ToDos>> {
  HomePageCubit() : super([]);

  var tRepo = ToDosDaoRepository();

  Future<void> getDataTodos() async {
    var todos = await tRepo.getDataTodos();
    emit(todos);
  }

  Future<void> search(String searchText) async {
    var liste = await tRepo.search(searchText);
    emit(liste);
  }

  Future<void> deleteTodo(int id) async {
    await tRepo.deleteTodo(id);
    getDataTodos();
  }
}
