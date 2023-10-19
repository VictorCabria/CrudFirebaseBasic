import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';


import '../../../../services/model_services/pacientes_services.dart';
import '../../../introduccion/login/controllers/login_controller.dart';

class CreatepacientesController extends GetxController {
  final formkey = GlobalKey<FormState>();
  late TextEditingController nombrecontroller;
  late TextEditingController identificacioncontroller;
  late TextEditingController generocontroller;
  late TextEditingController condicionMcontroller;
    final homeControll = Get.find<LoginController>();

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
           idusuario: homeControll.usuario!.id
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
