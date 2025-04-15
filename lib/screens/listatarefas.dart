import 'package:flutter/material.dart';
import 'package:tarefa/components/Task.dart';

class Listatarefas extends StatefulWidget {
  const Listatarefas({super.key});

  @override
  State<Listatarefas> createState() => _ListatarefasState();
}

class _ListatarefasState extends State<Listatarefas> {
  final List<Widget> _tasks = []; // Lista para armazenar as tarefas

  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(nome: taskName)); // Adiciona uma nova tarefa à lista
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ..._tasks, // Exibe as tarefas armazenadas na lista

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _taskController,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome da tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  _addTask(_taskController.text); // Adiciona a tarefa
                  _taskController.clear(); // Limpa o campo de texto
                }
              },
              child: const Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}