import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/medicamentos_model.dart';
import '../../../../models/pacientes_model.dart';
import '../../../../services/model_services/medicamentos_services.dart';
import '../../../../services/model_services/notificicacion_service.dart';

class ListademedicaNController extends GetxController {
//Variables y Listas
  RxList<Medicamentos> medicamentos = RxList<Medicamentos>([]);
  List<Medicamentos> get medicamentosget => medicamentos;
  late Stream<List<Medicamentos>> medicamentosStream;
  RxBool isloading = false.obs;
  String hoy = DateFormat('hh:mm').format(DateTime.now()).toString();
  String fechalimite =
      DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  Pacientes? paciente;
// Inicializar metodos
  @override
  void onInit() {
    paciente = Get.arguments['id'];
    medicamentosStream = getmedico();
    super.onInit();
    init();
  }

  getmedico() => medicamentoservices
      .obtenerlistmedicamentos()
      .where("idpaciente", isEqualTo: paciente!.id)
      .snapshots()
      .map((event) => event.docs.map((e) => Medicamentos.fromJson(e)).toList());

  init() {
    medicamentosStream.listen((event) async {
      medicamentos.value = event;
      validaciondehora();
    });
  }

  validaciondehora() async {
    for (var i = 0; i < medicamentos.length; i++) {
      if (medicamentos[i].fechaExpiracion == fechalimite) {
        break;
      } else {
        if (medicamentos[i].hora == hoy) {
          notificaionees.shownotify(
              id: 0,
              title: medicamentos[i].nombreM!,
              body: (('''Dosis: ${medicamentos[i].dosis!}'''
                      "\n") +
                  ('''Hora: ${medicamentos[i].hora}'''
                      "\n")),
              payload: "");
        }
      }
    }
  }
}
