import 'dart:convert';
import 'package:banca/src/models/cuenta.dart';
import 'package:banca/src/models/prestamo.dart';
import 'package:banca/src/models/solicitud.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = 'http://leonelh2024-001-site1.ntempurl.com';

  // Login
  static Future<bool> login(String user, String pass) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Security/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'user': user, 'pass': pass}),
    );
    return response.statusCode == 200;
  }

  // Obtener cuentas por cliente
  static Future<List<Cuenta>> getCuentasPorCliente(String clienteId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Cuenta/GetAllByCustomer?clienteId=$clienteId'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Cuenta.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar cuentas');
    }
  }

  // Obtener préstamos por cliente
  static Future<List<Prestamo>> getPrestamosPorCliente(String clienteId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Prestamo/GetAllByCustomer?clienteId=$clienteId'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Prestamo.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar préstamos');
    }
  }

  // Obtener solicitudes por cliente
  static Future<List<Solicitud>> getSolicitudesPorCliente(String clienteId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Solicitud/GetAllByCustomerId?clienteId=$clienteId'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Solicitud.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar solicitudes');
    }
  }
}
