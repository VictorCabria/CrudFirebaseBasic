import 'package:get/get.dart';

import '../controllers/listapacientes_controller.dart';

class ListapacientesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListapacientesController>(
      () => ListapacientesController(),
    );
  }
}
