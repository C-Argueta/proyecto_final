class Prestamo {
  final String prestamoId;
  final String clienteId;
  final double tasaInteres;
  final int plazo;
  final double monto;
  final String estado;
  final String fechaCreacion;
  final String fechaPrestamo;
  final double saldo;

  Prestamo({
    required this.prestamoId,
    required this.clienteId,
    required this.tasaInteres,
    required this.plazo,
    required this.monto,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.saldo,
  });

  factory Prestamo.fromJson(Map<String, dynamic> json) {
    return Prestamo(
      prestamoId: json['PrestamoId'],
      clienteId: json['ClienteId'],
      tasaInteres: json['TasaInteres'].toDouble(),
      plazo: json['Plazo'],
      monto: json['Monto'].toDouble(),
      estado: json['Estado'],
      fechaCreacion: json['FechaCreacion'],
      fechaPrestamo: json['FechaPrestamo'],
      saldo: json['Saldo'].toDouble(),
    );
  }
}
