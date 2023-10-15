import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';

import '../../../../services/model_services/pacientes_services.dart';

class CreatepacientesController extends GetxController {
  final formkey = GlobalKey<FormState>();
  late TextEditingController nombrecontroller;
  late TextEditingController identificacioncontroller;
  late TextEditingController generocontroller;
  late TextEditingController condicionMcontroller;

  @override
  void onInit() {
    nombrecontroller = TextEditingController();
    identificacioncontroller = TextEditingController();
    generocontroller = TextEditingController();
    condicionMcontroller = TextEditingController();
    super.onInit();
  }

  addpacientes() async {
    Pacientes paciente = Pacientes(
        nombre: nombrecontroller.text,
        edad: double.tryParse(
          identificacioncontroller.text.toString().replaceAll(",", "")),
          condicionm: condicionMcontroller.text,
           genero: generocontroller.text,
          );

    try {
      if (formkey.currentState!.validate()) {
        await pacienteservices.savepacientes(pacientes: paciente);
        Get.back();
      }
    } on Exception catch (e) {
      return 'Error $e';
    }
  }
}
