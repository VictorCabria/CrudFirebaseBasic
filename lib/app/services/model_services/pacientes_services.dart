import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:prestamo_mc_2_0/app/models/genero_model.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';
import 'package:prestamo_mc_2_0/app/models/user_model.dart';
import 'package:prestamo_mc_2_0/app/utils/references.dart';

import '../firebase_services/database_services.dart';

class PacientesServices {
  static String pacientesReference = firebaseReferences.pacientes;
  static String generoReference = firebaseReferences.genero;
  static String usuarioReference = firebaseReferences.users;

  static final PacientesServices _instance = PacientesServices._internal();

  factory PacientesServices() {
    return _instance;
  }
  PacientesServices._internal();
  var firestore = FirebaseFirestore.instance;

  DocumentSnapshot? lastDocument;

   FirebaseFirestore getlisttipoprestamo = FirebaseFirestore.instance;
  CollectionReference obtenergenero() {
    return FirebaseFirestore.instance.collection(generoReference);
  }

  Future<bool> savepacientes({Pacientes? pacientes}) async {
    try {
      await database.save(
        pacientes!.toJson(),
        pacientesReference,
      );
      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> updatepacientes(Pacientes pacientes) async {
    try {
      DocumentReference docRef = database.getDocumentReference(
          collection: pacientesReference, documentId: pacientes.id!);
      await docRef.update(pacientes.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<List<Genero>> getgeneroById(String id) async {
    try {
      print("id $id");
      List<Genero> genero = [];
      var querySnapshot = await database.getDataById(id, generoReference);
      print("query snapshot ${querySnapshot.docs.length}");
      genero.addAll(
          querySnapshot.docs.map((e) => Genero.fromJson(e)).toList());

      return genero;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  FirebaseFirestore getlistpacientes = FirebaseFirestore.instance;
  CollectionReference obtenerlistpacientes() {
    return FirebaseFirestore.instance.collection(firebaseReferences.pacientes);
  }

    Future<Usuarios?> loginpacientes(String id) async {
    // try {
    print("id: $id");
    List<Usuarios> cobradores = [];
    var querySnapshot =
        await database.getCollection(usuarioReference, 'id', id);
    print("querySnapshot ${querySnapshot.docs.length}");
    cobradores
        .addAll(querySnapshot.docs.map((e) => Usuarios.fromJson(e)).toList());

    return cobradores.first;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print("error ${e.toString()}");
    //   }
    //   return null;
    // }
  }
}

PacientesServices pacienteservices = PacientesServices();
