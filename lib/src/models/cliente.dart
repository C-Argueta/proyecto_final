class Cliente {
  final String clienteId;
  final String clienteLogin;
  final String dni;
  final String nombre;
  final String apellido;
  final String fechaCreacion;
  final String estado;
  final String clave;

  Cliente({
    required this.clienteId,
    required this.clienteLogin,
    required this.dni,
    required this.nombre,
    required this.apellido,
    required this.fechaCreacion,
    required this.estado,
    required this.clave,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      clienteId: json['ClienteId'],
      clienteLogin: json['ClienteLogin'],
      dni: json['Dni'],
      nombre: json['Nombre'],
      apellido: json['Apellido'],
      fechaCreacion: json['FechaCreacion'],
      estado: json['Estado'],
      clave: json['Clave'],
    );
  }
}
