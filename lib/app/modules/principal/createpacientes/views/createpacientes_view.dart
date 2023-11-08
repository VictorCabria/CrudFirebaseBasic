import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/genero_model.dart';
import 'package:prestamo_mc_2_0/app/utils/palette.dart';

import '../controllers/createpacientes_controller.dart';

class CreatepacientesView extends GetView<CreatepacientesController> {
  const CreatepacientesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List listg = ["Masculino", "Femenino"];
    String g = 'Dog';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Registro de pacientes'),
          centerTitle: true,
          backgroundColor: Palette.tercery,
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
                cursorColor: Palette.tercery,
                controller: controller.nombrecontroller,
                onSaved: (value) {
                  controller.nombrecontroller.text = value!;
                },
                style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Palette.tercery),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.tercery),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.tercery,
                      ),
                    ),
                    labelText: "Nombre del paciente",
                    fillColor: Palette.tercery,
                    labelStyle: TextStyle(color: Palette.tercery)),
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
                cursorColor: Palette.tercery,
                controller: controller.identificacioncontroller,
                style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.hourglass_bottom_sharp,
                        color: Palette.tercery),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.tercery),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(
                        color: Palette.tercery,
                      ),
                    ),
                    labelText: "Edad",
                    fillColor: Palette.tercery,
                    labelStyle: TextStyle(color: Palette.tercery)),
              ),
            ),
            const SizedBox(height: 15),
           Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Obx(
                      () => DropdownButtonFormField(
                          items: controller.generocontroller.map((items) {
                            return DropdownMenuItem<Genero>(
                                value: items, child: Text(' ${items.tipo}'));
                          }).toList(),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle,
                                  color: Palette.tercery),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                                borderSide: BorderSide(
                                  color: Palette.tercery,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                ),
                                borderSide: BorderSide(
                                  color: Palette.tercery,
                                ),
                              ),
                              labelText: "Genero",
                              fillColor: Palette.tercery,
                              labelStyle: TextStyle(color: Palette.tercery)),
                          onChanged: controller.onChangeDorpdown),
                    )),
            const SizedBox(height: 15),
         
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: Palette.tercery,
                controller: controller.condicionMcontroller,
                onSaved: (value) {
                  controller.condicionMcontroller.text = value!;
                },
                style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
                decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.medical_information, color: Palette.tercery),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      borderSide: BorderSide(color: Palette.tercery),
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
                    fillColor: Palette.tercery,
                    labelStyle: TextStyle(color: Palette.tercery)),
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
                          MaterialStateProperty.all(Palette.tercery)),
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
                          MaterialStateProperty.all(Palette.tercery)),
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
