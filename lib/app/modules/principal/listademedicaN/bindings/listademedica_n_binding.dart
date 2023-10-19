import 'package:get/get.dart';

import '../controllers/listademedica_n_controller.dart';

class ListademedicaNBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListademedicaNController>(
      () => ListademedicaNController(),
    );
  }
}
