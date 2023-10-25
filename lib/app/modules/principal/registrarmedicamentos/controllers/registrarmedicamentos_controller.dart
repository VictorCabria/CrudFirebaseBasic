import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/medicamentos_model.dart';
import '../../../../models/pacientes_model.dart';
import '../../../../services/model_services/medicamentos_services.dart';

class RegistrarmedicamentosController extends GetxController {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();
  late TextEditingController nombreMcontroller;
  late TextEditingController dosiscontroller;
  late TextEditingController condicionMcontroller;
  late TextEditingController fromDateControler;
  late TextEditingController fromDatetimeControler;
   Pacientes? paciente;
   TimeOfDay selectedtime = TimeOfDay.now();



  @override
  void onInit() {
    paciente = Get.arguments;
    nombreMcontroller = TextEditingController();
    dosiscontroller = TextEditingController();
    condicionMcontroller = TextEditingController();
    fromDateControler = TextEditingController();
    fromDatetimeControler = TextEditingController();
    super.onInit();
  }

  addpacientes() async {
    Medicamentos medicamentos = Medicamentos(
      nombreM: nombreMcontroller.text,
      idpaciente: paciente?.id,
      fechaExpiracion: fromDateControler.text,
      dosis:double.tryParse(dosiscontroller.text),
      hora: fromDatetimeControler.text,

    );

      try {
      if (formKey.currentState!.validate()) {
        await medicamentoservices.savemedicamentos(medicamentos: medicamentos);
        Get.back();
      }
    } on Exception catch (e) {
      return 'Error $e';
    } 
  }
}