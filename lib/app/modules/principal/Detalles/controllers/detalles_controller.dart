import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/model_services/pacientes_services.dart';

class DetallesController extends GetxController {
  //TODO: Implement DetallesController
  RxList<Pacientes> pacientes = RxList<Pacientes>();
  final count = 0.obs;

  Pacientes? paciente;
  @override
  void onInit() {
    paciente = Get.arguments;
    super.onInit();
  }

  getgenero(String id) async {
    var response = await pacienteservices.getgeneroById(id);
    if (response.isNotEmpty) {
      return response.first;
    }
  }
}
