import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/utils/palette.dart';

import '../controllers/createpacientes_controller.dart';

class CreatepacientesView extends GetView<CreatepacientesController> {
  const CreatepacientesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Registro de pacientes'),
          centerTitle: true,
          backgroundColor: Palette.primary,
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          )),
      body: Form(
        key: controller.formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.primary,
                controller: controller.nombrecontroller,
                onSaved: (value) {
                  controller.nombrecontroller.text = value!;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.headset, color: Palette.primary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primary,
                      ),
                    ),
                    labelText: "Nombre del paciente",
                    fillColor: Palette.primary,
                    labelStyle: TextStyle(color: Palette.primary)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.number,
                cursorColor: Palette.primary,
                controller: controller.identificacioncontroller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.headset, color: Palette.primary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primary,
                      ),
                    ),
                    labelText: "Edad",
                    fillColor: Palette.primary,
                    labelStyle: TextStyle(color: Palette.primary)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.primary,
                controller: controller.generocontroller,
                onSaved: (value) {
                  controller.generocontroller.text = value!;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.headset, color: Palette.primary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primary,
                      ),
                    ),
                    labelText: "Genero",
                    fillColor: Palette.primary,
                    labelStyle: TextStyle(color: Palette.primary)),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.primary,
                controller: controller.condicionMcontroller,
                onSaved: (value) {
                  controller.condicionMcontroller.text = value!;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.headset, color: Palette.primary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primary,
                      ),
                    ),
                    labelText: "Condicion Medica",
                    fillColor: Palette.primary,
                    labelStyle: TextStyle(color: Palette.primary)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Palette.primary)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Atras",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Palette.primary)),
                  onPressed: () {
                    controller.addpacientes();
                  },
                  child: const Text(
                    "Guardar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
