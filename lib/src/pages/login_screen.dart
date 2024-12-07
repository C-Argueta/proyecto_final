import 'package:banca/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    String user = _usernameController.text;
    String pass = _passwordController.text;
    bool success = await ApiService.login(user, pass);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login fallido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Usuario')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Contraseña'), obscureText: true),
            ElevatedButton(onPressed: _login, child: Text('Iniciar Sesión')),
          ],
        ),
      ),
    );
  }
}
