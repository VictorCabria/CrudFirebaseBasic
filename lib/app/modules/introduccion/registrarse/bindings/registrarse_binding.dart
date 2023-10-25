import 'package:get/get.dart';

import '../controllers/registrarse_controller.dart';

class RegistrarseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrarseController>(
      () => RegistrarseController(),
    );
  }
}
