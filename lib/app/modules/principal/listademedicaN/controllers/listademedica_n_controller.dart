import 'package:get/get.dart';

import '../../../../models/medicamentos_model.dart';
import '../../../../services/model_services/medicamentos_services.dart';

class ListademedicaNController extends GetxController {

//Variables y Listas
  RxList<Medicamentos> medicamentos = RxList<Medicamentos>([]);
  List<Medicamentos> get medicamentosget => medicamentos;
  late Stream<List<Medicamentos>> medicamentosStream;
  RxBool isloading = false.obs;

// Inicializar metodos
  @override
  void onInit() {
    medicamentosStream = getmedico();
    super.onInit();
    init();
  }

  getmedico() => medicamentoservices
    .obtenerlistmedicamentos()
    .snapshots()
    .map((event) => event.docs.map((e) => Medicamentos.fromJson(e)).toList());


init() {
  medicamentosStream.listen((event) async {
      medicamentos.value = event;
    });
}
// Creacion de metodos


}
