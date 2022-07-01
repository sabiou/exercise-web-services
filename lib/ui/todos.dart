import 'package:flutter/material.dart';
import 'package:flutter_http/api/http_service.dart';
import 'package:flutter_http/model/todo.dart';
import 'package:flutter_http/ui/todo_detail.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodosPage> {
  late Future<List<Todo>> futureTodos;
  final httpService = HttpService();

  @override
  void initState() {
    super.initState();
    futureTodos = httpService.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Todo>? todos = snapshot.data;
            return ListView(
              children: todos!
                  .map(
                    (Todo todo) => ListTile(
                      title: Text(todo.title),
                      subtitle: Text("${todo.userId}"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoDetail(todo: todo)));
                      },
                    ),
                  )
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
