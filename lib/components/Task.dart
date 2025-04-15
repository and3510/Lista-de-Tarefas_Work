import 'package:flutter/material.dart';

class Task extends StatefulWidget {

  final String nome;


  const Task(this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline),
          const SizedBox(width: 10),
          Text(widget.nome),

        ],
      ),
    );
  }
}