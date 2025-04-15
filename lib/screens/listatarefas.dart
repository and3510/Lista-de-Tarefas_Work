import 'package:flutter/material.dart';

class Listatarefas extends StatefulWidget {
  const Listatarefas({super.key});

  @override
  State<Listatarefas> createState() => _ListatarefasState();
}

class _ListatarefasState extends State<Listatarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Você tem 0 tarefas pendentes',
            ),
            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão
              },
              child: const Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}