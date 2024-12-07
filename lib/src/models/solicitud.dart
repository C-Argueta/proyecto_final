class Solicitud {
  final String solicitudId;
  final String clienteId;
  final String proposito;
  final double tasaInteres;
  final double monto;
  final String estado;
  final String fechaCreacion;
  final String fechaPrestamo;

  Solicitud({
    required this.solicitudId,
    required this.clienteId,
    required this.proposito,
    required this.tasaInteres,
    required this.monto,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaPrestamo,
  });

  factory Solicitud.fromJson(Map<String, dynamic> json) {
    return Solicitud(
      solicitudId: json['SolicitudId'],
      clienteId: json['ClienteId'],
      proposito: json['Proposito'],
      tasaInteres: json['TasaInteres'].toDouble(),
      monto: json['Monto'].toDouble(),
      estado: json['Estado'],
      fechaCreacion: json['FechaCreacion'],
      fechaPrestamo: json['FechaPrestamo'],
    );
  }
}
