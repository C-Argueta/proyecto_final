import 'package:banca/src/models/prestamo.dart';
import 'package:banca/src/services/api_service.dart';
import 'package:flutter/material.dart';


class PrestamosScreen extends StatefulWidget {
  @override
  _PrestamosScreenState createState() => _PrestamosScreenState();
}

class _PrestamosScreenState extends State<PrestamosScreen> {
  late Future<List<Prestamo>> _prestamos;

  @override
  void initState() {
    super.initState();
    _prestamos = ApiService.getPrestamosPorCliente('clienteId'); // Aquí debes usar el clienteId adecuado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Préstamos')),
      body: FutureBuilder<List<Prestamo>>(
        future: _prestamos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tienes préstamos'));
          }

          final prestamos = snapshot.data!;

          return ListView.builder(
            itemCount: prestamos.length,
            itemBuilder: (context, index) {
              final prestamo = prestamos[index];
              return ListTile(
                title: Text('Prestamo ID: ${prestamo.prestamoId}'),
                subtitle: Text('Monto: ${prestamo.monto} - Estado: ${prestamo.estado}'),
                onTap: () {
                  // Puedes navegar a una pantalla de detalles si lo deseas
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Detalles del Préstamo'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cliente ID: ${prestamo.clienteId}'),
                          Text('Tasa de Interés: ${prestamo.tasaInteres}'),
                          Text('Plazo: ${prestamo.plazo} meses'),
                          Text('Saldo: ${prestamo.saldo}'),
                          Text('Fecha de Creación: ${prestamo.fechaCreacion}'),
                          Text('Fecha de Préstamo: ${prestamo.fechaPrestamo}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
