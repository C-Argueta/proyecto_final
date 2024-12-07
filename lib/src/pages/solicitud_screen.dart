import 'package:banca/src/models/solicitud.dart';
import 'package:banca/src/services/api_service.dart';
import 'package:flutter/material.dart';


class SolicitudesScreen extends StatefulWidget {
  @override
  _SolicitudesScreenState createState() => _SolicitudesScreenState();
}

class _SolicitudesScreenState extends State<SolicitudesScreen> {
  late Future<List<Solicitud>> _solicitudes;

  @override
  void initState() {
    super.initState();
    _solicitudes = ApiService.getSolicitudesPorCliente('clienteId'); // Aquí debes usar el clienteId adecuado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Solicitudes')),
      body: FutureBuilder<List<Solicitud>>(
        future: _solicitudes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tienes solicitudes'));
          }

          final solicitudes = snapshot.data!;

          return ListView.builder(
            itemCount: solicitudes.length,
            itemBuilder: (context, index) {
              final solicitud = solicitudes[index];
              return ListTile(
                title: Text('Solicitud ID: ${solicitud.solicitudId}'),
                subtitle: Text('Monto: ${solicitud.monto} - Estado: ${solicitud.estado}'),
                onTap: () {
                  // Puedes navegar a una pantalla de detalles si lo deseas
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Detalles de la Solicitud'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cliente ID: ${solicitud.clienteId}'),
                          Text('Propósito: ${solicitud.proposito}'),
                          Text('Tasa de Interés: ${solicitud.tasaInteres}'),
                          Text('Monto: ${solicitud.monto}'),
                          Text('Fecha de Creación: ${solicitud.fechaCreacion}'),
                          Text('Fecha de Préstamo: ${solicitud.fechaPrestamo}'),
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
