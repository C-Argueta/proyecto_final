import 'package:banca/src/models/cuenta.dart';
import 'package:banca/src/services/api_service.dart';
import 'package:flutter/material.dart';


class CuentasScreen extends StatefulWidget {
  @override
  _CuentasScreenState createState() => _CuentasScreenState();
}

class _CuentasScreenState extends State<CuentasScreen> {
  late Future<List<Cuenta>> _cuentas;

  @override
  void initState() {
    super.initState();
    _cuentas = ApiService.getCuentasPorCliente('clienteId'); // Reemplaza con el clienteId real
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cuentas')),
      body: FutureBuilder<List<Cuenta>>(
        future: _cuentas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tienes cuentas'));
          }

          final cuentas = snapshot.data!;

          return ListView.builder(
            itemCount: cuentas.length,
            itemBuilder: (context, index) {
              final cuenta = cuentas[index];
              return ListTile(
                title: Text('Cuenta ID: ${cuenta.cuentaId}'),
                subtitle: Text('Saldo Inicial: ${cuenta.saldoInicial} - Estado: ${cuenta.estado}'),
                onTap: () {
                  // Mostrar los detalles de la cuenta en un dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Detalles de la Cuenta'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cliente ID: ${cuenta.clienteId}'),
                          Text('Tipo de Saldo: ${cuenta.tipoSaldo}'),
                          Text('Saldo Inicial: ${cuenta.saldoInicial}'),
                          Text('Cuota de Aporte: ${cuenta.cuotaAporte}'),
                          Text('Estado: ${cuenta.estado}'),
                          Text('Fecha de Creación: ${cuenta.fechaCreacion}'),
                          Text('Fecha de Apertura: ${cuenta.fechaApertura}'),
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
