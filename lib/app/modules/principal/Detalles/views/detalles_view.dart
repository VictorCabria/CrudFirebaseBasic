import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detalles_controller.dart';

class DetallesView extends GetView<DetallesController> {
  const DetallesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "${controller.paciente!.nombre}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "${controller.paciente!.condicionm}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "${controller.paciente!.genero}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "${controller.paciente!.edad}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(controller.pacientes.length.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ));
  }
}
