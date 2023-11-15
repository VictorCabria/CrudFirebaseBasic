import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/services/model_services/user_service.dart';

import '../../../../models/user_model.dart';
import '../../../../services/firebase_services/auth_services.dart';
import '../../../../utils/palette.dart';

class RegistrarseController extends GetxController {
  //TODO: Implement RegistrarseController
  late TextEditingController nombresController,
      emaileditController,
      passwordeditController;
  final formkey = GlobalKey<FormState>();
  RxList<Usuarios> usuario = RxList<Usuarios>([]);
  late Stream<List<Usuarios>> usuarioStream;

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
    usuarioStream = getusuario();
    super.onInit();
    init();
  }

  getusuario() => userService
      .obtenerlistusuarios()
      .snapshots()
      .map((event) => event.docs.map((e) => Usuarios.fromJson(e)).toList());

  init() {
    usuarioStream.listen((event) async {
      usuario.value = event;
      print(event);
    });
  }

  signUp() async {
    if (formkey.currentState!.validate()) {
      for (var i in usuario) {
        if (i.correo == emaileditController.text) {
          Get.dialog(AlertDialog(
            content: const Text("Este usuario ya existe"),
            actions: <Widget>[
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Palette.tercery)),
                  child: Text("Aceptar"),
                  onPressed: () {
                    Get.back();
                  }),
            ],
          ));
        } else {
          var response = await auth.signUp(
              emaileditController.text, passwordeditController.text);
          if (response != null) {
            auth.postDetailsToFirestore(nombresController.text);
            Get.back();
          }
        }
      }
    }
  }
}
