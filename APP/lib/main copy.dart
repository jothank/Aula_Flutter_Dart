import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 400),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(40)),
        child: ElevatedButton(
          onPressed: () {},
          child: Text('CLIQUE AQUI'),
        ),
        // child: Image.asset('assets/images/image.png'),
        // child: Center(
        //   child: Text(
        //     'Titulo',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 50,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
