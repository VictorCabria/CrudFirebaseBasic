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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        centerTitle: true,
        backgroundColor: Palette.primary,
        actions: [
           IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => controller.logout(),
                  )
        ],
          
      
      ),
      body: GetX<HomeController>(
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
      bottomSheet: Container(
          color: Palette.secondary,
          height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 80.w),
                margin: const EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Palette.primary,
                        child: IconButton(
                            onPressed: () => controller.createpaciente(),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                    ]),
              ),
    ])));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.controller, required this.s})
      : super(key: key);

  final HomeController controller;

  final Rx<Pacientes> s;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: ListTile(
     onTap: (){
     controller.getAjustesPT(s.value);
     },
        title: Text(s.value.nombre!),
        subtitle: Text("${s.value.condicionm}"),
       
      ),
    );
  }
}


