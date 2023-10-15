import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/palette.dart';
import '../controllers/registrarmedicamentos_controller.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

class RegistrarmedicamentosView
    extends GetView<RegistrarmedicamentosController> {
  const RegistrarmedicamentosView({Key? key}) : super(key: key);
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
                controller: controller.nombreMcontroller,
                onSaved: (value) {
                  controller.nombreMcontroller.text = value!;
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
                    labelText: "Nombre del medicamento",
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
                controller: null,
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
                    labelText: "Fecha expiracion",
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
                controller: controller.dosiscontroller,
                onSaved: (value) {
                  controller.dosiscontroller.text = value!;
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
                    labelText: "Dosis",
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
            const SizedBox(height: 15),
            Container(
              child: TextFormField(
                onTap: () async {
                  final TimeOfDay? pickedTime =  await showTimePicker(context: context, 
                  initialTime: controller.selectedtime,
                  initialEntryMode: TimePickerEntryMode.dial 
                  );

                  if (pickedTime != null) {
                    controller.fromDateControler.text =
                        '${pickedTime.hour}:${pickedTime.minute}';
                  }
                },
                controller: controller.fromDateControler,
                onSaved: (value) {
                  controller.fromDateControler.text = value!;
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
                    labelText: "Fecha expiracion",
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
