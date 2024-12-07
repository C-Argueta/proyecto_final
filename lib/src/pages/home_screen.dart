import 'package:banca/src/pages/solicitud_screen.dart';
import 'package:flutter/material.dart';
import 'perfil_screen.dart';
import 'cuentas_screen.dart';
import 'prestamos_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Perfil'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilScreen()),
            ),
          ),
          ListTile(
            title: Text('Cuentas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CuentasScreen()),
            ),
          ),
          ListTile(
            title: Text('Préstamos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrestamosScreen()),
            ),
          ),
          ListTile(
            title: Text('Solicitudes'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SolicitudesScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
