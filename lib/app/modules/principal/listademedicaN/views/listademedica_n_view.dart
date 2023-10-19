import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../models/medicamentos_model.dart';
import '../../../../utils/palette.dart';
import '../controllers/listademedica_n_controller.dart';

class ListademedicaNView extends GetView<ListademedicaNController> {
  const ListademedicaNView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListademedicaNView'),
        centerTitle: true,
      ),
      body: GetX<ListademedicaNController>(
            builder: (b) => b.isloading.value
                ? const CircularProgressIndicator()
                : ListView(
                    children: b.medicamentosget
                        .map(
                          (element) => SizedBox(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 1,
                                ),
                                CustomCard(
                                  controller: b,
                                  s: element.obs,
                                ),
                                const Divider(
                                  thickness: 0.5,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()),
          ),
    );
  }
}


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.controller, required this.s})
      : super(key: key);

  final ListademedicaNController controller;

  final Rx<Medicamentos> s;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: ListTile(
        title: Text(s.value.nombreM!, style: const TextStyle(fontSize: 18)),
        isThreeLine: true,
        subtitle: Text(s.value.hora!),
       
      ),
    );
  }
}
