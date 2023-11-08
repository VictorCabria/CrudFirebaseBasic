import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';
import 'package:prestamo_mc_2_0/app/models/user_model.dart';
import 'package:prestamo_mc_2_0/app/modules/introduccion/login/controllers/login_controller.dart';
import 'package:prestamo_mc_2_0/app/services/model_services/notificicacion_service.dart';

import 'package:prestamo_mc_2_0/app/services/model_services/pacientes_services.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firebase_services/auth_services.dart';

class HomeController extends GetxController {
  RxList<Pacientes> pacientes = RxList<Pacientes>();
  late Stream<List<Pacientes>> pacienteStream;
  List<Pacientes> get pacientesget => pacientes;
  RxBool isloading = false.obs;

 Usuarios? usuario;
  @override
  void onInit() {
    usuario = Get.arguments['usuario'];
    pacienteStream = getpacientes();
    super.onInit();
 print(usuario);
    init();
  }

  init() {
    pacienteStream.listen((event) async {
      pacientes.value = event;
    });
  }

  getpacientes() => pacienteservices
      .obtenerlistpacientes()
      .where("idusuario", isEqualTo: usuario!.id)
      .snapshots()
      .map((event) => event.docs.map((e) => Pacientes.fromJson(e)).toList());

  logout() async {
    var response = await auth.signOut();
    if (response) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }


   getgeneroId(String id) async {
    var response = await pacienteservices.getgeneroById(id);
    if (response.isNotEmpty) {
      return response.first;
    }
  }





  
  getAjustesPT(Pacientes d) {
    Get.toNamed(Routes.AJUSTESPT, arguments: d);
  }

  createpaciente() {
    Get.toNamed(Routes.CREATEPACIENTES, arguments:{'usuario':usuario});
  }
}
