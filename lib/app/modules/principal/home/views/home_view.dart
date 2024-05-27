import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/palette.dart';


import '../../../../utils/text_styles.dart';
import '../../../widgets/header.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Scaffold(
            body: Container(
          color: Palette.cuary,
          height: 100.h,
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                title: !controller.isExpanded.value
                    ? const Text("")
                    : const Text("Prestamos"),
                automaticallyImplyLeading: false,
                centerTitle: true,
                expandedHeight: 20.h,
                pinned: true,
                backgroundColor: Palette.primary,
                flexibleSpace: FlexibleSpaceBar(
                  background: HeaderWidget(controller: controller),
                ),
                actions: [
                  !controller.gestorMode.value
                      ? IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                        
                          },
                        )
                      : const SizedBox(),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => controller.logout(),
                  )
                ],
              ),
              // SliverToBoxAdapter(
              //   child: Padding(
              //     padding: EdgeInsets.all(5.w),
              //     child: SingleChildScrollView(
              //       scrollDirection: Axis.horizontal,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           CardInfo(
              //             name: "Saldo",
              //             value: controller.saldo,
              //           ),
              //           CardInfo(
              //             name: "Prestamos",
              //             value: controller.prestamos,
              //           ),
              //           CardInfo(
              //             name: "Recaudos",
              //             value: controller.recaudos,
              //           ),
              //           CardInfo(
              //             name: "Transacciones",
              //             value: controller.transacciones,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              controller.gestorMode.value
                  ? Obx(() => (SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 2.h,
                          ),
                          child: Card(
                            child: Container(
                              height: 20.h,
                              margin: EdgeInsets.symmetric(
                                horizontal: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/icons/dashboard.png",
                                    scale: 1.5,
                                  ),
                                  SizedBox(width: 5.h),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [Text(
                                                  "prueba",
                                                  style: styles.tittle,
                                                )]
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )))
                  : (SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.h,
                          vertical: 2.h,
                        ),
                        child: GestureDetector(
                         
                          child: Card(
                            child: Container(
                              height: 20.h,
                              margin: EdgeInsets.symmetric(
                                horizontal: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/icons/dashboard.png",
                                    scale: 1.5,
                                  ),
                                  SizedBox(width: 5.h),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [Text(
                                                  "Informacion",
                                                  style: styles.tittle,
                                                )]
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              SliverToBoxAdapter(
                child: SizedBox(height: 1.h),
              ),
              SliverGrid.count(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: controller.gestorMode.value
                    ? [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 1.5.h,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              
                            },
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/prestamo.png",
                                      scale: 1.5,
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      "Recaudos",
                                      style: styles.tittleSub,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 1.5.h,
                          ),
                          child: GestureDetector(
                            onTap: () {
                             
                            },
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/transaccion.png",
                                      scale: 1.5,
                                    ),
                                    SizedBox(height: 0.5.h),
                                    FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Transacciones",
                                        maxLines: 1,
                                        style: styles.tittleSub,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    : [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 2.h,
                          ),
                          child: GestureDetector(
                            onTap: () => controller.goTousuarios(),
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/banco.png",
                                      scale: 1.5,
                                    ),
                                    Text(
                                      "Pacientes",
                                      style: styles.tittleSub,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 2.h,
                          ),
                          child: GestureDetector(
                            onTap: () => {},
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/prestamo.png",
                                      scale: 1.5,
                                    ),
                                    Text(
                                      "Medicamentos",
                                      style: styles.tittleSub,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.h,
                            vertical: 2.h,
                          ),
                          child: GestureDetector(
                            onTap: () {
                           
                            },
                            child: Card(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/transaccion.png",
                                      scale: 1.5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "Informes",
                                        maxLines: 1,
                                        style: styles.tittleSub,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                       
                      ],
              )
              // SessionWidget(),
              // const SizedBox(height: 20),
              // const Text('Hello World'),
            ],
          ),
        )),
        controller.cargando.value == true
            ? Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                ),
                child: const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 5,
                )),
              )
            : Container(),
      ]),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.value,
    required this.name,
  }) : super(key: key);

  final RxString value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 80,
        width: 100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.value,
                style: styles.tittle,
              ),
              Text(
                name,
                style: styles.tittleSub,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SessionWidget extends StatelessWidget {
  const SessionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderContainer(
        height: double.infinity,
        color: Palette.tercery,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(
                'Bienvenido ${controller.cobrador}',
                overflow: TextOverflow.ellipsis,
                style: styles.tittleRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

