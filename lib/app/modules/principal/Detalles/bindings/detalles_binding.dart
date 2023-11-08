import 'package:get/get.dart';

import '../controllers/detalles_controller.dart';

class DetallesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetallesController>(
      () => DetallesController(),
    );
  }
}
