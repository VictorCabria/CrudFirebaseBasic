import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/genero_model.dart';

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
                  "Nombre: ${controller.paciente!.nombre}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Condicion Medica: ${controller.paciente!.condicionm}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  child: FutureBuilder(
                      future: controller.getgenero(controller.paciente!.genero),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Genero genero = snapshot.data as Genero;
                          return Text(
                            ("Genero: ${genero.tipo!}"),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          );
                        } else {
                          return const Text("");
                        }
                      })),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  "Edad: ${controller.paciente!.edad!.toStringAsFixed(0)}",
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
