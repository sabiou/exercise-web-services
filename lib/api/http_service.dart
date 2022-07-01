import 'dart:convert';
import 'package:flutter_http/model/todo.dart';
import 'package:http/http.dart';

class HttpService {
  final String todosURL = "https://jsonplaceholder.typicode.com/todos";

  // requete GET pour recuperer la liste des todos
  Future<List<Todo>> getTodos() async {
    final response = await get(Uri.parse(todosURL));

    if (response.statusCode == 200) {
      // Si la reponse obtenue du serveur est 200 (OK), parser le JSON
      List<dynamic> body = jsonDecode(response.body);
      List<Todo> todos = body
          .map(
            (dynamic item) => Todo.fromJson(item),
          )
          .toList();
      return todos;
    } else {
      // sinon, retourner une exception
      throw 'Erreur de chargment des todos';
    }
  }
}
