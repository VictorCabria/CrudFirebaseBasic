



class Medicamentos {
  String? id;
  String? idpaciente;
  String? nombreM;
  String? fechaExpiracion;
  double? dosis;
  String? hora;

  Medicamentos({
    this.id,
    this.nombreM,
    this.idpaciente,
    this.fechaExpiracion,
    this.dosis,
    this.hora,
  });

  factory Medicamentos.fromJson(map) {
    return Medicamentos(
      id: map.id,
      nombreM: map['nombreM'],
      idpaciente: map['idpaciente'],
      fechaExpiracion: map['fechaExpiracion'],
      dosis: map['dosis'],
      hora: map["hora"],

    );
  }

  factory Medicamentos.fromDinamic(dinamico) {
    var idMap = dinamico["id"];
    return Medicamentos(
      id: idMap,
      nombreM: dinamico['nombreM'],
      idpaciente: dinamico['idpaciente'],
      fechaExpiracion: dinamico['fechaExpiracion'],
      dosis: dinamico['dosis'],
      hora: dinamico["hora"],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nombreM'] = nombreM;
    data['idpaciente'] = idpaciente;
    data['fechaExpiracion'] = fechaExpiracion;
    data['dosis'] = dosis;
    data["hora"] = hora;
 
    return data;
  }
}
