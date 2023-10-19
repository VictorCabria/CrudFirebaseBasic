import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:prestamo_mc_2_0/app/utils/references.dart';

import '../../models/medicamentos_model.dart';
import '../firebase_services/database_services.dart';

class MedicamentosServices{
   static String medicamentosReference = firebaseReferences.medicamentos;
  static final MedicamentosServices _instance = MedicamentosServices._internal();

  factory MedicamentosServices() {
    return _instance;
  }
  MedicamentosServices._internal();
  var firestore = FirebaseFirestore.instance;

  DocumentSnapshot? lastDocument;

  Future<bool> savemedicamentos({Medicamentos? medicamentos}) async {
    try {
      await database.save(
        medicamentos!.toJson(),
        medicamentosReference,
      );
      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  FirebaseFirestore getlistmedicamentos = FirebaseFirestore.instance;
  CollectionReference obtenerlistmedicamentos() {
    return FirebaseFirestore.instance.collection(firebaseReferences.medicamentos);
}

}

MedicamentosServices medicamentoservices =MedicamentosServices();