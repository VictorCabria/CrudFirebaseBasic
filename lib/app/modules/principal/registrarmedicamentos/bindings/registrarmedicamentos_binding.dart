import 'package:get/get.dart';

import '../controllers/registrarmedicamentos_controller.dart';

class RegistrarmedicamentosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrarmedicamentosController>(
      () => RegistrarmedicamentosController(),
    );
  }
}
