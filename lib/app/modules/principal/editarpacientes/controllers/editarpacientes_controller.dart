import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/genero_model.dart';
import 'package:prestamo_mc_2_0/app/services/model_services/pacientes_services.dart';

import '../../../../models/pacientes_model.dart';

class EditarpacientesController extends GetxController {
  //TODO: Implement EditarpacientesController
  final formkey = GlobalKey<FormState>();
  late Pacientes paciente;
  Genero? pacientesespecifico;
  final nombre = "".obs;
  final edad = 0.0.obs;
  final condicion = "".obs;
  RxBool loading = false.obs;
  late Stream<List<Genero>> tipogeneroStream;
  RxList<Genero> tipogenerocontroller = RxList<Genero>([]);
  @override
  void onInit() {
    paciente = Get.arguments['pacientes'];
    tipogeneroStream = getgenero();
    nombre.value = paciente.nombre!;
    edad.value = paciente.edad!;
    condicion.value = paciente.condicionm!;
    init();
    super.onInit();
  }

  void onChangeDorpdown(String? tipo) {
    pacientesespecifico =
        tipogenerocontroller.firstWhere((element) => element.id == tipo);
  }

  getgenero() => pacienteservices
      .obtenergenero()
      .snapshots()
      .map((event) => event.docs.map((e) => Genero.fromJson(e)).toList());

  init() {
    tipogeneroStream.listen((event) async {
      tipogenerocontroller.value = event;
      pacientesespecifico = tipogenerocontroller
          .firstWhere((element) => element.id == paciente.genero);
      loading.value = false;
    });
  }

  editarpacientes() async {
    if (formkey.currentState!.validate()) {
      paciente.nombre = nombre.value;
      paciente.genero = pacientesespecifico!.id;
      paciente.edad = edad.value;
      paciente.condicionm = condicion.value;
      await pacienteservices.updatepacientes(paciente);
      Get.back();
    }
  }
}
