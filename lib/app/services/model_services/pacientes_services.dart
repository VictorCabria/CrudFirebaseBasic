import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';
import 'package:prestamo_mc_2_0/app/utils/references.dart';

import '../firebase_services/database_services.dart';

class PacientesServices{
   static String zonaReference = firebaseReferences.pacientes;
  static final PacientesServices _instance = PacientesServices._internal();

  factory PacientesServices() {
    return _instance;
  }
  PacientesServices._internal();
  var firestore = FirebaseFirestore.instance;

  DocumentSnapshot? lastDocument;

  Future<bool> savepacientes({Pacientes? pacientes}) async {
    try {
      await database.save(
        pacientes!.toJson(),
        zonaReference,
      );
      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  FirebaseFirestore getlistpacientes = FirebaseFirestore.instance;
  CollectionReference obtenerlistpacientes() {
    return FirebaseFirestore.instance.collection(firebaseReferences.pacientes);
}

}

PacientesServices pacienteservices =PacientesServices();