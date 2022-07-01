import 'package:flutter/material.dart';
import 'package:flutter_http/model/todo.dart';

class TodoDetail extends StatelessWidget {
  final Todo todo;
  const TodoDetail({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text(todo.id.toString()),
            subtitle: Text(todo.title),
          ),
        ),
      ),
    );
  }
}
