import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/references.dart';

class AjustesptController extends GetxController {
  //TODO: Implement AjustesptController

  Pacientes? paciente;
  @override
  void onInit() {
    paciente = Get.arguments;
    super.onInit();
  }

  getmedicamentos(Pacientes d) {
    Get.toNamed(Routes.REGISTRARMEDICAMENTOS, arguments: d);
  }

  getlistamedicamentosN(Pacientes d) {
    Get.toNamed(Routes.LISTADEMEDICA_N, arguments: {'id': d});
  }

  getDetalles(Pacientes d) {
    Get.toNamed(Routes.DETALLES, arguments: d);
  }

  geteditar(Pacientes d) {
    Get.toNamed(Routes.EDITARPACIENTES, arguments: {firebaseReferences.pacientes: d});
  }
}
