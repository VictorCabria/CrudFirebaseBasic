import 'package:get/get.dart';

import '../controllers/createpacientes_controller.dart';

class CreatepacientesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatepacientesController>(
      () => CreatepacientesController(),
    );
  }
}
