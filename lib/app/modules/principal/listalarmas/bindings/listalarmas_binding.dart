import 'package:get/get.dart';

import '../controllers/listalarmas_controller.dart';

class ListalarmasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListalarmasController>(
      () => ListalarmasController(),
    );
  }
}
