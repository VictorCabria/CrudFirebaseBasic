import 'package:get/get.dart';

import '../controllers/editarpacientes_controller.dart';

class EditarpacientesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditarpacientesController>(
      () => EditarpacientesController(),
    );
  }
}
