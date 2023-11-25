import 'package:odev7/data/entity/todo_model.dart';
import 'package:odev7/sqlite/database_helper.dart';

class ToDosDaoRepository {
  Future<void> saveTodo(String name) async {
    var db = await DatabaseHelper.databaseAccess();
    var newTodo = <String, dynamic>{};
    newTodo["name"] = name;
    await db.insert("todos", newTodo);
  }

  Future<void> updateTodo(int id, String name) async {
    var db = await DatabaseHelper.databaseAccess();
    var updatedTodo = <String, dynamic>{};
    updatedTodo["name"] = name;
    await db.update("todos", updatedTodo, where: "id = ?", whereArgs: [id]);
  }

  Future<List<ToDos>> getDataTodos() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> satirlar =
        await db.rawQuery("SELECT * FROM todos");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(id: id, name: name);
    });
  }

  Future<List<ToDos>> search(String searchText) async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String, dynamic>> satirlar = await db
        .rawQuery("SELECT * FROM todos WHERE name like '%$searchText%'");

    return List.generate(satirlar.length, (index) {
      var satir = satirlar[index];
      var id = satir["id"];
      var name = satir["name"];
      return ToDos(name: name, id: id);
    });
  }

  Future<void> deleteTodo(int id) async {
    var db = await DatabaseHelper.databaseAccess();

    await db.delete("todos", where: "id = ?", whereArgs: [id]);
  }
}
