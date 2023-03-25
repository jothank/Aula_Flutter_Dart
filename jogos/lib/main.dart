import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Sua Jogada'),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pedra.png'),
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/papel.png'),
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/tesoura.png'),
                      radius: 60,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Text('Jogada do Computador'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pedra.png'),
                    radius: 60,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              Text('Resultado'),
              Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Você'),
                      Text('Computador'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('0'),
                      Text('0'),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
