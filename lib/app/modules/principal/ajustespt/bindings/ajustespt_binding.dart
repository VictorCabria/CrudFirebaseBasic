import 'package:get/get.dart';

import '../controllers/ajustespt_controller.dart';

class AjustesptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjustesptController>(
      () => AjustesptController(),
    );
  }
}
