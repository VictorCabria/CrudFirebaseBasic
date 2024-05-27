import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';

import '../../../../models/user_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/firebase_services/auth_services.dart';
import '../../../../services/model_services/pacientes_services.dart';

class HomeController extends GetxController {
  final gestorMode = false.obs;
  final loading = false.obs;
  final isExpanded = false.obs;
  final isOpen = false.obs;
  final isNulll = true.obs;
  RxBool cargando = false.obs;

  Usuarios? usuario;

  //info de la session
  final fecha = ''.obs;
  final cobrador = ''.obs;
  final saldo = 0.0.obs;
  final zona = ''.obs;
  final prestamos = ''.obs;
  final transacciones = ''.obs;
  final recaudos = ''.obs;

  final scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    cargando.value = true;
    gestorMode.value =
        Get.arguments != null ? Get.arguments['gestorMode'] : false;
    await getusuario();

    scrollController.addListener(_onScroll);
    cargando.value = false;
  }

  getusuario() async {
    if (gestorMode.value) {
      usuario = Get.arguments != null ? Get.arguments['usuarios'] : null;
      cobrador.value = usuario!.nombre!;
    } else {
      var response =
          await pacienteservices.loginpacientes(auth.getCurrentUser()!.uid);
      if (response != null) {
        usuario = response;
        cobrador.value = usuario!.nombre!;
        print('Cobrador${usuario!.nombre!}');
      }
    }
  }

  void goTousuarios() {
    print('goToPrestamos');
    Get.toNamed(Routes.LISTAPACIENTES);
  }

  logout() async {
    var response = await auth.signOut();
    if (response) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  _onScroll() {
    isExpanded.value = isSliverAppBarExpanded;
    if (kDebugMode) {
      print(isExpanded.value);
    }
  }

  bool get isSliverAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (150 - kToolbarHeight);
  }
}
