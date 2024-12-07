import 'package:banca/src/models/cliente.dart';
import 'package:banca/src/services/api_service.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  late Future<Cliente> _cliente;

  @override
  void initState() {
    super.initState();
    _cliente = ApiService.getCuentasPorCliente('clienteId') as Future<Cliente>; // ID del cliente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: FutureBuilder<Cliente>(
        future: _cliente,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final cliente = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cliente ID: ${cliente.clienteId}'),
                Text('Nombre: ${cliente.nombre} ${cliente.apellido}'),
                Text('DNI: ${cliente.dni}'),
                Text('Estado: ${cliente.estado}'),
                Text('Fecha Creación: ${cliente.fechaCreacion}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
