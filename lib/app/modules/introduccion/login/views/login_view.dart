import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/palette.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.tercery,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: PassLogin(
                        controller: controller,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class PassLogin extends StatelessWidget {
  const PassLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.w),
        SizedBox(
            child: Image.asset(
          "assets/images/Recurso1.png",
          height: 160,
        )),
        SizedBox(height: 12.w),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 30,
                color: Palette.primaryLetter,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 6.w),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.name,
            controller: controller.emailcontroller,
            validator: (value) {
              return null;
            },
            onSaved: (value) {
              controller.emailcontroller.text = value!;
            },
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.next,
            cursorColor: Palette.primaryLetter,
            decoration: const InputDecoration(
                prefixIcon:
                    Icon(Icons.account_circle, color: Palette.primaryLetter),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  borderSide: BorderSide(
                    color: Palette.primaryLetter,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  borderSide: BorderSide(
                    color: Palette.primaryLetter,
                  ),
                ),
                labelText: "Correo",
                fillColor: Palette.primary,
                labelStyle: TextStyle(color: Palette.primaryLetter)),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.visiblePassword,
            controller: controller.passwordcontroller,
            validator: (value) {
              return null;
            },
            onSaved: (value) {
              controller.passwordcontroller.text = value!;
            },
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.next,
            cursorColor: Palette.primaryLetter,
            obscureText: true,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key, color: Palette.primaryLetter),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  borderSide: BorderSide(
                    color: Palette.primaryLetter,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  borderSide: BorderSide(
                    color: Palette.primaryLetter,
                  ),
                ),
                labelText: "Contraseña",
                fillColor: Palette.primaryLetter,
                labelStyle: TextStyle(color: Palette.primaryLetter)),
          ),
        ),
        const SizedBox(height: 35),
        Material(
          borderRadius: BorderRadius.circular(20),
          color: Palette.primaryLetter,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            onPressed: () async {
              await controller.getusuarios(controller.emailcontroller.text);

              if (controller.usuario == null ||
                  controller.passwordcontroller.text.length <= 6) {
                Get.dialog(const AlertDialog(
                  title: Text("ESTE USUARIO NO EXISTE"),
                  content: Text("O ESTÁ MAL ESCRITO"),
                ));
              } else {
                controller.authUser(
                  controller.emailcontroller.text,
                  controller.passwordcontroller.text,
                );
              }
            },
            child: const Text(
              "Ingresar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Palette.tercery,
                  fontWeight: FontWeight.bold),
            ),
          ),

          /* TextButton(
        onPressed: () => controller.getToHome(),
        child: const Text("Login")), */
        ),
        SizedBox(height: 7.w),
        const Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: Text("¿No tienes cuenta?",
                  style: TextStyle(
                      fontSize: 15,
                      color: Palette.primaryLetter,
                      fontWeight: FontWeight.bold))),
        ),
        //    SizedBox(height: 1.w),
        TextButton(
            onPressed: () {
              controller.getToregistrar();
            },
            child: const Text("Registrarse",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette.primaryLetter,
                    fontWeight: FontWeight.bold))),
        const SizedBox(height: 40),
      ],
    );
  }
}
