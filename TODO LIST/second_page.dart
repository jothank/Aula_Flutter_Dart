import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todolist/homepage.dart';

class SecondPage extends StatefulWidget {
  String texto;

  SecondPage({super.key, required this.texto});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List tarefas = ['Estudar', 'Ir para Academia', 'Jogar'];
  TextEditingController _nomeTarefa = TextEditingController();
  PageController _pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO-LIST'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(widget.texto),
                accountEmail: Text(widget.texto + '@hotmail.com'),
                currentAccountPicture:
                    CircleAvatar(child: Text(widget.texto.characters.first))),
            ListTile(
              onTap: () {
                _pagecontroller.jumpToPage(0);
                Navigator.pop(context);
              },
              title: Text('Home'),
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              subtitle: Text('home'),
            ),
            ListTile(
              onTap: () {
                _pagecontroller.jumpToPage(1);
                Navigator.pop(context);
              },
              title: Text('Tarefas'),
              leading: CircleAvatar(
                child: Icon(Icons.list),
              ),
              subtitle: Text('tarefas'),
            ),
            ListTile(
              onTap: () {
                _pagecontroller.jumpToPage(2);
                Navigator.pop(context);
              },
              title: Text('Deletadas'),
              leading: CircleAvatar(
                child: Icon(Icons.delete),
              ),
              subtitle: Text('deletadas'),
            ),
            ListTile(
              onTap: () {
                _pagecontroller.jumpToPage(3);
                Navigator.pop(context);
              },
              title: Text('Sobre'),
              leading: CircleAvatar(
                child: Icon(Icons.question_mark),
              ),
              subtitle: Text('sobre'),
            )
          ],
        ),
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
