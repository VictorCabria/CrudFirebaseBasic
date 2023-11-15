import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/palette.dart';
import '../controllers/registrarmedicamentos_controller.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

class RegistrarmedicamentosView
    extends GetView<RegistrarmedicamentosController> {
  const RegistrarmedicamentosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(children: [
                SizedBox(
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
                    "Registrar Medicamento",
                    style: TextStyle(
                        fontSize: 20,
                        color: Palette.tercery,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _nombreMField(),
                const SizedBox(height: 20),
                //fecha de expiracion
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    onTap: () async {
                      final DateTime? pickedTime = await showDatePicker(
                          context: context,
                          initialDate: controller.selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                      if (pickedTime != null) {
                        controller.fromDateControler.text =
                            '${pickedTime.day}/${pickedTime.month}/${pickedTime.year}';
                      }
                    },
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Palette.tercery,
                    controller: controller.fromDateControler,
                    onSaved: (value) {
                      controller.fromDateControler.text = value!;
                    },
                    style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
                    decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.calendar_month, color: Palette.tercery),
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
                        labelText: "Fecha expiracion",
                        fillColor: Palette.tercery,
                        labelStyle: TextStyle(color: Palette.tercery)),
                  ),
                ),
                const SizedBox(height: 20),
                _dosisFiedl(),
                const SizedBox(height: 20),
                _condicionMField(),
                const SizedBox(height: 20),
                //HORA
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: controller.selectedtime,
                        initialEntryMode: TimePickerEntryMode.dial,
                        builder: (context, child) {
                          final Widget mediaQueryWrapper = MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              alwaysUse24HourFormat: false,
                            ),
                            child: child!,
                          );
                          // A hack to use the es_US dateTimeFormat value.
                          if (Localizations.localeOf(context).languageCode ==
                              'es') {
                            return Localizations.override(
                              context: context,
                              locale: Locale('es', 'US'),
                              child: mediaQueryWrapper,
                            );
                          }
                          return mediaQueryWrapper;
                        },
                      );

                      if (pickedTime != null) {
                        controller.fromDatetimeControler.text =
                            '${pickedTime.hourOfPeriod}:${pickedTime.minute}';
                      }
                    },
                    controller: controller.fromDatetimeControler,
                    onSaved: (value) {
                      controller.fromDatetimeControler.text = value!;
                    },
                    style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.hourglass_bottom,
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
                        labelText: "Hora",
                        fillColor: Palette.tercery,
                        labelStyle: TextStyle(color: Palette.tercery)),
                  ),
                ),
                const SizedBox(height: 30),
                _bottos(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nombreMField() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        cursorColor: Palette.tercery,
        controller: controller.nombreMcontroller,
        onSaved: (value) {
          controller.nombreMcontroller.text = value!;
        },
        style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
        decoration: const InputDecoration(
            prefixIcon:
                Icon(Icons.medical_services_rounded, color: Palette.tercery),
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
            labelText: "Nombre del medicamento",
            fillColor: Palette.tercery,
            labelStyle: TextStyle(color: Palette.tercery)),
      ),
    );
  }

  Widget _dosisFiedl() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        cursorColor: Palette.tercery,
        controller: controller.dosiscontroller,
        onSaved: (value) {
          controller.dosiscontroller.text = value!;
        },
        style: TextStyle(color: Color.fromARGB(255, 30, 144, 255)),
        decoration: const InputDecoration(
            prefixIcon:
                Icon(Icons.medication_liquid_sharp, color: Palette.tercery),
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
            labelText: "Dosis",
            fillColor: Palette.tercery,
            labelStyle: TextStyle(color: Palette.tercery)),
      ),
    );
  }

  Widget _condicionMField() {
    return Container(
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
            prefixIcon: Icon(Icons.medical_information, color: Palette.tercery),
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
    );
  }

  Widget _bottos() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Palette.tercery)),
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
                backgroundColor: MaterialStateProperty.all(Palette.tercery)),
            onPressed: () {
              if (controller.nombreMcontroller.text.length == 0 ||
                  controller.condicionMcontroller.text.length == 0 ||
                  controller.fromDateControler.text.length == 0 ||
                  controller.fromDatetimeControler.text.length == 0 ||
                  controller.dosiscontroller.text.length == 0) {
                Get.dialog(const AlertDialog(
                    title: Text("POR FAVOR"),
                    content: Text("COMPLETAR TODOS LOS CAMPOS")));
              } else {
                controller.addpacientes();
              }
            },
            child: const Text(
              "Guardar",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
