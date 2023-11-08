class Pacientes {
  String? id;
  double? edad;
  String? idusuario;
  String? nombre;
  dynamic genero;
  String? condicionm;

  Pacientes({
    this.id,
    this.edad,
    this.nombre,
    this.idusuario,
    this.genero,
    this.condicionm,
  });

  factory Pacientes.fromJson(map) {
    return Pacientes(
      id: map.id,
      nombre: map['nombre'],
      edad: map['edad'],
      idusuario: map['idusuario'],
      genero: map['genero'],
      condicionm: map['condicionm'],
    );
  }

  factory Pacientes.fromDinamic(dinamico) {
    var idMap = dinamico["id"];
    return Pacientes(
      id: idMap,
      nombre: dinamico['nombre'],
      edad: dinamico['edad'],
      idusuario: dinamico['idusuario'],
      genero: dinamico['genero'],
      condicionm: dinamico['condicionm'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nombre'] = nombre;
    data['edad'] = edad;
    data['idusuario'] = idusuario;
    data['genero'] = genero;
    data['condicionm'] = condicionm;

    return data;
  }
}
