import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex: Estudar Flutter',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Todo newTodo = Todo(
                                title: todoController.text,
                                dateTime: DateTime.now()
                            );
                            todos.add(newTodo);
                          });
                          todoController.clear();
                        },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xff00d7f3)),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14))
                      ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                        for(Todo todo in todos)
                          TodoListItem(
                            todo: todo
                          )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: Text('Você possui ${todos.length} tarefas pendentes')
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xff00d7f3)),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                        ),
                        child: const Text(
                            'Limpar tudo',
                          style: TextStyle(color: Colors.white),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}