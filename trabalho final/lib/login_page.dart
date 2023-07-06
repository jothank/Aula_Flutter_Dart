import 'package:flutter/material.dart';
import 'food_selection_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logotipo.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    labelText: 'Login',
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                width: 200,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Entrar', style: TextStyle(fontSize: 18.0)),
                  onPressed: () {
                    // String login = _loginController.text;
                    // String senha = _senhaController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodSelectionPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
