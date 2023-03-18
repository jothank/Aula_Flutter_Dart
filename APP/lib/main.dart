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
      body: PageView(
        children: [
          Container(
            color: Colors.yellow,
            child: ListView(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Restaurente App',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Image.asset('assets/images/hamburguer.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Online Order',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 40),
                        primary: Colors.white,
                        onPrimary: Colors.black, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Book a Table',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 40),
                        primary: Colors.white,
                        onPrimary: Colors.black, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Give Feedback',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 40),
                        primary: Colors.white,
                        onPrimary: Colors.black, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
