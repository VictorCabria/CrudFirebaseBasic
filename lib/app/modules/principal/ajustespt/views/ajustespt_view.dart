import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/palette.dart';
import '../controllers/ajustespt_controller.dart';

class AjustesptView extends GetView<AjustesptController> {
  const AjustesptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajustes Paciente',
        ),
        centerTitle: true,
        backgroundColor: Palette.primary,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: const CircleAvatar(
                          radius: 30, backgroundColor: Colors.black)),
                   Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.paciente!.nombre}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                         Text(
                          "${controller.paciente!.condicionm}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(Icons.edit),
                ),
                title: const Text("Editar",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                onTap: () {}),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(Icons.notification_add),
                ),
                title: const Text("Notificaciones",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                onTap: () {}),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(Icons.report),
                ),
                title: const Text("Registro de medicamentos",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                onTap: () {
                  controller.getmedicamentos(controller.paciente!);
                }),
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Icon(Icons.deblur),
                ),
                title: const Text("Detalles",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                onTap: () {}),
          ]),
        ),
      ),
    );
  }
}
