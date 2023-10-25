import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/palette.dart';
import '../controllers/registrarse_controller.dart';

class RegistrarseView extends GetView<RegistrarseController> {
  const RegistrarseView({Key? key}) : super(key: key);
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

  final RegistrarseController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            child: Image.asset(
          "assets/images/Recurso1.png",
          height: 160,
        )),
        SizedBox(height: 10.w),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: Text(
            "Registrarse",
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
            controller: controller.nombresController,
            keyboardType: TextInputType.name,
            validator: (value) {
              return null;
            },
            onSaved: (value) {
              controller.nombresController.text = value!;
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
            
            controller: controller.emaileditController,
            validator: (value) {
              return null;
            },
            onSaved: (value) {
              controller.emaileditController.text = value!;
            },
            textInputAction: TextInputAction.next,
             keyboardType: TextInputType.emailAddress,
            cursorColor: Palette.primaryLetter,
           
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
                labelText: "Correo",
                fillColor: Palette.primaryLetter,
                labelStyle: TextStyle(color: Palette.primaryLetter)),
          ),
        ),
        const SizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: TextFormField(
            autofocus: false,
            keyboardType: TextInputType.visiblePassword,
            controller: controller.passwordeditController,
            obscureText: true,
            validator: (value) {
              return null;
            },
            onSaved: (value) {
              controller.passwordeditController.text = value!;
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
                labelText: "Contraseña",
                fillColor: Palette.primary,
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
            onPressed: ()  {
              controller.signUp();
            },
            child: const Text(
              "Registrar",
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
      ],
    );
  }
}
