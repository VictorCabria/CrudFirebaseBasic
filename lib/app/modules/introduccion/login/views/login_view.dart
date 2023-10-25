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
        SizedBox(
            child: Image.asset(
          "assets/images/Recurso1.png",
          height: 200,
        )),
        SizedBox(height: 10.w),
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
        SizedBox(height: 5.w),
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
                labelText: "Nombre",
                fillColor: Palette.primary,
                labelStyle: TextStyle(color: Palette.primaryLetter)),
          ),
        ),
        const SizedBox(height: 3),
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
        const SizedBox(height: 15),
        Material(
          borderRadius: BorderRadius.circular(20),
          color: Palette.primaryLetter,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            onPressed: () async {
              await controller
                  .getusuarios(controller.emailcontroller.toString());

              controller.authUser(controller.emailcontroller.text,
                  controller.passwordcontroller.text);
            },
            child: const Text(
              "Login",
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
        const SizedBox(height: 15),
        TextButton(
            onPressed: () {
              controller.getToregistrar();
            },
            child: const Text("Registrarse",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette.primaryLetter,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}