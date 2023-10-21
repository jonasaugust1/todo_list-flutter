import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          todos.add(todoController.text);
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
                      for(String todo in todos)
                        const TodoListItem()
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                      child: Text('Você possui 0 tarefas pendentes')
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
    );
  }
}