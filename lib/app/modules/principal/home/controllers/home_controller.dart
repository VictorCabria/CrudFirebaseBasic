import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';
import 'package:prestamo_mc_2_0/app/modules/introduccion/login/controllers/login_controller.dart';
import 'package:prestamo_mc_2_0/app/services/model_services/pacientes_services.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/firebase_services/auth_services.dart';

class HomeController extends GetxController {
  RxList<Pacientes> pacientes = RxList<Pacientes>();
  late Stream<List<Pacientes>> pacienteStream;
  List<Pacientes> get pacientesget => pacientes;
  RxBool isloading = false.obs;
  final homeControll = Get.find<LoginController>();

  @override
  void onInit() {
    pacienteStream = getpacientes();
    super.onInit();

    init();
  }

  init() {
    pacienteStream.listen((event) async {
      pacientes.value = event;
    });
  }

  getpacientes() => pacienteservices
      .obtenerlistpacientes()
      .where("idusuario", isEqualTo: homeControll.usuario!.id)
      .snapshots()
      .map((event) => event.docs.map((e) => Pacientes.fromJson(e)).toList());

  logout() async {
    var response = await auth.signOut();
    if (response) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  
  getAjustesPT(Pacientes d) {
    Get.toNamed(Routes.AJUSTESPT, arguments: d);
  }

  createpaciente() {
    Get.toNamed(Routes.CREATEPACIENTES);
  }
}
