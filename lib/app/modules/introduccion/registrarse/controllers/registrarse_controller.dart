import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user_model.dart';
import '../../../../services/firebase_services/auth_services.dart';

class RegistrarseController extends GetxController {
  //TODO: Implement RegistrarseController
  late TextEditingController nombresController,
      emaileditController,
      passwordeditController;
  final formkey = GlobalKey<FormState>();

  late Usuarios user;

  final nombres = "".obs;
  final email = "".obs;
  final password = "".obs;
  final confirmarpassword = "".obs;

  @override
  void onInit() {
    nombresController = TextEditingController();
    emaileditController = TextEditingController();
    passwordeditController = TextEditingController();

    super.onInit();
  }

  signUp() async {
    if (formkey.currentState!.validate()) {
      var response = await auth.signUp(
          emaileditController.text, passwordeditController.text);
      if (response != null) {
        auth.postDetailsToFirestore(nombresController.text);
        Get.back();
      }
    }
  }
}
