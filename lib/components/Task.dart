import 'package:flutter/material.dart';

class Task extends StatefulWidget {

  final String nome;


  const Task({required this.nome, Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _isDone = true; // Variável de estado para controlar se a tarefa está feita


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
            IconButton(
            icon: Icon(
              _isDone ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: () {
              setState(() {
                _isDone = !_isDone; // Alterna o estado da tarefa
              });
            },
          ),
          const SizedBox(width: 10),
          Text(widget.nome, style: TextStyle( color: _isDone ? Colors.grey : Colors.black),),

        ],
      ),
    );
  }
}