import 'package:get/get.dart';

import '../../../../models/medicamentos_model.dart';
import '../../../../models/pacientes_model.dart';
import '../../../../services/model_services/medicamentos_services.dart';

class ListademedicaNController extends GetxController {

//Variables y Listas
  RxList<Medicamentos> medicamentos = RxList<Medicamentos>([]);
  List<Medicamentos> get medicamentosget => medicamentos;
  late Stream<List<Medicamentos>> medicamentosStream;
  RxBool isloading = false.obs;
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
    });
}
// Creacion de metodos


}