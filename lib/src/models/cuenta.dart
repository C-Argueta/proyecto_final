class Cuenta {
  final String cuentaId;
  final String clienteId;
  final String tipoSaldo;
  final double saldoInicial;
  final double cuotaAporte;
  final String estado;
  final String fechaCreacion;
  final String fechaApertura;

  Cuenta({
    required this.cuentaId,
    required this.clienteId,
    required this.tipoSaldo,
    required this.saldoInicial,
    required this.cuotaAporte,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaApertura,
  });

  factory Cuenta.fromJson(Map<String, dynamic> json) {
    return Cuenta(
      cuentaId: json['CuentaId'],
      clienteId: json['ClienteId'],
      tipoSaldo: json['TipoSaldo'],
      saldoInicial: json['SaldoInicial'].toDouble(),
      cuotaAporte: json['CuotaAporte'].toDouble(),
      estado: json['Estado'],
      fechaCreacion: json['FechaCreacion'],
      fechaApertura: json['FechaApertura'],
    );
  }
}
