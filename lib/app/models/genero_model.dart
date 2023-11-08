class Genero {
  String? id;
  String? tipo;

  Genero({this.id, this.tipo});

   factory Genero.fromJson(map) {
    return Genero(
        id: map.id,
        tipo: map['tipo'],
      );
  }
  factory Genero.fromDinamic(dinamico) {
    var idMap = dinamico["id"];
    return Genero(
      id: idMap,
      tipo: dinamico['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tipo'] = tipo;
    return data;
  }
}
