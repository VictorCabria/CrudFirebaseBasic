import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prestamo_mc_2_0/app/models/pacientes_model.dart';

import '../../../../models/genero_model.dart';
import '../../../../models/user_model.dart';
import '../../../../services/model_services/pacientes_services.dart';
import '../../../introduccion/login/controllers/login_controller.dart';

class CreatepacientesController extends GetxController {
  final formkey = GlobalKey<FormState>();
  late TextEditingController nombrecontroller;
  late TextEditingController identificacioncontroller;
  late TextEditingController condicionMcontroller;
  Usuarios? usuario;

  RxList<Genero> generocontroller = RxList<Genero>([]);
  late Stream<List<Genero>> conceptoStream;
  Genero? selectgenero;

  @override
  void onInit() {
    usuario = Get.arguments['usuario'];
    nombrecontroller = TextEditingController();
    identificacioncontroller = TextEditingController();
    condicionMcontroller = TextEditingController();
    super.onInit();
    conceptoStream =getgenero();
    init();
  }

  getgenero() => pacienteservices
      .obtenergenero()
      .snapshots()
      .map((event) => event.docs.map((e) => Genero.fromJson(e)).toList());

  init() {
    conceptoStream.listen((event) async {
      generocontroller.value = event;
    });
  }

  void onChangeDorpdown(Genero? tipogenero) {
    selectgenero = tipogenero!;
  }

  addpacientes() async {
    Pacientes paciente = Pacientes(
        nombre: nombrecontroller.text,
        edad: double.tryParse(
            identificacioncontroller.text.toString().replaceAll(",", "")),
        condicionm: condicionMcontroller.text,
        genero: selectgenero!.id,
        idusuario: usuario!.id);

    try {
      if (formkey.currentState!.validate()) {
        await pacienteservices.savepacientes(pacientes: paciente);
        Get.back();
      }
    } on Exception catch (e) {
      return 'Error $e';
    }
  }
}
