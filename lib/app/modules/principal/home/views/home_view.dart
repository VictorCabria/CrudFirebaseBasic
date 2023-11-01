import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../models/pacientes_model.dart';
import '../../../../utils/palette.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('Pacientes'),
          centerTitle: true,
          backgroundColor: Palette.tercery,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => controller.logout(),
            ),
            /* IconButton(
                icon: const Icon(Icons.abc),
                onPressed: () => controller.notificaciones()) */
          ],
        ),
        body: Stack(children: [
          GetX<HomeController>(
            builder: (b) => b.isloading.value
                ? const CircularProgressIndicator()
                : ListView(
                    children: b.pacientesget
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
        ]),
        bottomSheet: Container(
            color: Palette.tercery,
            height: 10.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.w),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Palette.primaryLetter,
                            child: IconButton(
                                onPressed: () => controller.createpaciente(),
                                icon: const Icon(
                                  Icons.add,
                                  color: Palette.tercery,
                                )),
                          ),
                        ]),
                  ),
                  Container(
                margin: const EdgeInsets.all(10),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      Text("",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
              
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Pacientes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      Text(controller.pacientes.length.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
            ],
          ),
        )
                ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.controller, required this.s})
      : super(key: key);

  final HomeController controller;

  final Rx<Pacientes> s;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black45,
        ),
      ),
      child: ListTile(
          onTap: () {
            controller.getAjustesPT(s.value);
          },
          onLongPress: () {},
          title: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              (s.value.nombre!),
              style: const TextStyle(fontSize: 20, color: Palette.tercery),
            ),
          ),
          isThreeLine: true,
          subtitle: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 10.w),
                           Text((s.value.condicionm!),
                              style: TextStyle(fontSize: 15)),

                          /* const SizedBox(height: 10),
              Container(
                  child: const Text("Proximo Pago",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(height: 5),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${s.fechaPago}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ), */
                        ]),
                  ),
                   const Divider(thickness: 5, height: 30,
                   color: Colors.greenAccent,
                   ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/Recurso4.png",
                                    height: 20,
                                  ),
                                  
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(8),
                                  child: Text(s.value.genero!,
                                                  style: TextStyle(color: Colors.grey),),
                                )
                              ],
                            ),
                            
                          ])),

                          Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/Recurso4.png",
                                    height: 20,
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(8),
                                  child: Text(s.value.edad!.toStringAsFixed(0),
                                                  style: TextStyle(color: Colors.grey),),
                            )],
                            ),
                            
                          ]))
                          
                    ],
                  )
                ]),
          ),
          leading: SizedBox(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.zero),
                child: Image.asset(
                  "assets/images/Recurso5.png",
                  height: 100,
                )),
          )),
    );
  }
}
