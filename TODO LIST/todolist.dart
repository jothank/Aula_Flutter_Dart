import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todolist/second_page.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  @override
  State<ToDoList> createState() => _ToDoListState();
}

TextEditingController _nome = TextEditingController();
var texto = 'Bem vindo - ';

class _ToDoListState extends State<ToDoList> {
  List tarefas = ['Estudar', 'Ir para Academia', 'Jogar'];
  TextEditingController _nomeTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tarefas[index]),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      tarefas.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Tarefa Deletada'),
                      backgroundColor: Color.fromARGB(255, 170, 39, 39),
                      duration: Duration(milliseconds: 1500),
                    ));
                  },
                  icon: Icon(Icons.delete)),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        height: 40,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Adicionar Tarefa'),
                    content: TextField(
                      controller: _nomeTarefa,
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tarefas.add(_nomeTarefa.text);
                              _nomeTarefa.clear();
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Adicionar')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _nomeTarefa.clear();
                          },
                          child: Text('Cancelar'))
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}
