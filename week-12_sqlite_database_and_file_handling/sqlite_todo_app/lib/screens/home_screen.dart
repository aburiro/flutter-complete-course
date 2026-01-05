import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBHelper dbHelper = DBHelper();
  final TextEditingController controller = TextEditingController();
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  void loadTodos() async {
    final data = await dbHelper.getTodos();
    setState(() {
      todos = data;
    });
  }

  void addTodo() async {
    if (controller.text.isEmpty) return;
    await dbHelper.insertTodo(Todo(title: controller.text));
    controller.clear();
    loadTodos();
  }

  void deleteTodo(int id) async {
    await dbHelper.deleteTodo(id);
    loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Todo App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter Todo',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addTodo,
            child: const Text('Add Todo'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTodo(todos[index].id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
