import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/palette.dart';
import '../controllers/editarpacientes_controller.dart';

class EditarpacientesView extends GetView<EditarpacientesController> {
  const EditarpacientesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formkey,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/mindLogo.png',
                  height: 160,
                ),
                SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
                  child: Text(
                    "Editar Paciente",
                    style: TextStyle(
                        fontSize: 20,
                        color: Palette.tercery,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                          items: controller.tipogenerocontroller.map((items) {
                            return DropdownMenuItem<String>(
                                value: items.id, child: Text(' ${items.tipo}'));
                          }).toList(),
                          style: TextStyle(color: Palette.tercery),
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
                              labelText: "Tipo",
                              fillColor: Palette.tercery,
                              labelStyle: TextStyle(color: Palette.tercery)),
                          value: controller.pacientesespecifico?.id,
                          onChanged: controller.onChangeDorpdown),
                    )),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: controller.nombre.value,
                    onChanged: (value) => controller.nombre.value = value,
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: Palette.tercery,
                    style: TextStyle(color: Palette.tercery),
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Palette.tercery),
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
                        labelText: "Nombre",
                        fillColor: Palette.primary,
                        labelStyle: TextStyle(color: Palette.tercery)),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: controller.edad.toStringAsFixed(0),
                    autofocus: false,
                    onChanged: (value) {
                      controller.edad.value = double.parse(value);
                    },
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: Palette.tercery,
                    style: TextStyle(color: Palette.tercery),
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Palette.tercery),
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
                        labelText: "Edad",
                        fillColor: Palette.tercery,
                        labelStyle: TextStyle(color: Palette.tercery)),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    initialValue: controller.condicion.value,
                    onChanged: (value) => controller.condicion.value = value,
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    cursorColor: Palette.tercery,
                    style: TextStyle(color: Palette.tercery),
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Palette.tercery),
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
                        labelText: "Condicion",
                        fillColor: Palette.tercery,
                        labelStyle: TextStyle(color: Palette.tercery)),
                  ),
                ),
                const SizedBox(height: 25),
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
                        controller.editarpacientes();
                      },
                      child: const Text(
                        "Guardar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
