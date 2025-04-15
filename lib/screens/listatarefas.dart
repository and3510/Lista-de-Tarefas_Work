import 'package:flutter/material.dart';

class Listatarefas extends StatefulWidget {
  const Listatarefas({super.key});

  @override
  State<Listatarefas> createState() => _ListatarefasState();
}

class _ListatarefasState extends State<Listatarefas> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tarefas = [];
  final List<bool> _tarefasConcluidas = []; // Lista para controlar tarefas concluídas
  int? _selecionadaIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adicionarTarefa() {
    String novaTarefa = _controller.text.trim();
    if (novaTarefa.isNotEmpty) {
      setState(() {
        _tarefas.add(novaTarefa);
        _tarefasConcluidas.add(false); // Adiciona o estado inicial como não concluído
        _controller.clear();
      });
    }
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
      _tarefasConcluidas.removeAt(index); // Remove o estado correspondente
      _selecionadaIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Adicione uma Tarefa:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Nova tarefa',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                      ),
                      onPressed: _adicionarTarefa,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = _tarefas[index];
                  final selecionada = index == _selecionadaIndex;
                  final concluida = _tarefasConcluidas[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selecionadaIndex = selecionada ? null : index;
                      });
                    },
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            concluida ? Icons.check_box : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            setState(() {
                              _tarefasConcluidas[index] = !_tarefasConcluidas[index];
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tarefa,
                            style: TextStyle(
                              fontSize: 18,
                              color: concluida ? Colors.grey : Colors.black, // Muda a cor para cinza se concluída
                              decoration: concluida ? TextDecoration.lineThrough : null, // Opcional: riscar o texto
                            ),
                          ),
                        ),
                        if (concluida) // Mostra o ícone da lixeira se a tarefa estiver concluída
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removerTarefa(index),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}