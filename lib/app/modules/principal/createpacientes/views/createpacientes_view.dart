import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/genero_model.dart';
import 'package:prestamo_mc_2_0/app/utils/palette.dart';

import '../controllers/createpacientes_controller.dart';

class CreatepacientesView extends GetView<CreatepacientesController> {
  const CreatepacientesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.tercery,
      body: Form(
        key: controller.formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/Recurso1.png",
              height: 160,
            ),
            SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
              child: Text(
                "Registrar Pacientes",
                style: TextStyle(
                    fontSize: 20,
                    color: Palette.primaryLetter,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Palette.tercery,
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.primaryLetter,
                controller: controller.nombrecontroller,
                onSaved: (value) {
                  controller.nombrecontroller.text = value!;
                },
                style: TextStyle(color: Palette.primaryLetter),
                decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.person, color: Palette.primaryLetter),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primaryLetter),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primaryLetter,
                      ),
                    ),
                    labelText: "Nombre del paciente",
                    fillColor: Palette.primaryLetter,
                    labelStyle: TextStyle(color: Palette.primaryLetter)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Palette.tercery,
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.number,
                cursorColor: Palette.primaryLetter,
                controller: controller.identificacioncontroller,
                style: TextStyle(color: Palette.primaryLetter),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.hourglass_bottom_sharp,
                        color: Palette.primaryLetter),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primaryLetter),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.primaryLetter,
                      ),
                    ),
                    labelText: "Edad",
                    fillColor: Palette.primaryLetter,
                    labelStyle: TextStyle(color: Palette.primaryLetter)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Palette.tercery,
                    borderRadius: BorderRadius.circular(20)),
                child: Obx(
                  () => DropdownButtonFormField(
                      items: controller.generocontroller.map((items) {
                        return DropdownMenuItem<Genero>(
                            value: items, child: Text(' ${items.tipo}'));
                      }).toList(),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle,
                              color: Palette.primaryLetter),
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
                          labelText: "Genero",
                          fillColor: Palette.primaryLetter,
                          labelStyle: TextStyle(color: Palette.primaryLetter)),
                      onChanged: controller.onChangeDorpdown),
                )),
            const SizedBox(height: 25),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Palette.tercery,
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.primaryLetter,
                controller: controller.condicionMcontroller,
                onSaved: (value) {
                  controller.condicionMcontroller.text = value!;
                },
                style: TextStyle(color: Palette.primaryLetter),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.medical_information,
                        color: Palette.primaryLetter),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.primaryLetter),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.tercery,
                      ),
                    ),
                    labelText: "Condicion Medica",
                    fillColor: Palette.primaryLetter,
                    labelStyle: TextStyle(color: Palette.primaryLetter)),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Palette.primaryLetter)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Atras",
                    style: TextStyle(fontSize: 18, color: Palette.tercery),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Palette.primaryLetter)),
                  onPressed: () {
                    if (controller.nombrecontroller.text.length == 0 ||
                        controller.identificacioncontroller.text.length == 0 ||
                        controller.condicionMcontroller.text.length == 0) {
                      Get.dialog(const AlertDialog(
                          title: Text("POR FAVOR"),
                          content: Text("COMPLETAR TODOS LOS CAMPOS")));
                    } else {
                      controller.addpacientes();
                    }
                  },
                  child: const Text(
                    "Guardar",
                    style: TextStyle(fontSize: 18, color: Palette.tercery),
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
