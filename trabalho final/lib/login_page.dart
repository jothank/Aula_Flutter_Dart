import 'package:flutter/material.dart';
import 'food_selection_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Login',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Entrar'),
              onPressed: () {
                String login = _loginController.text;
                String senha = _senhaController.text;

                // Aqui você pode adicionar lógica para validar o login e senha

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodSelectionPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
