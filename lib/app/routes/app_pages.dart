import 'package:get/get.dart';

import '../modules/introduccion/landing/bindings/landing_binding.dart';
import '../modules/introduccion/landing/views/landing_view.dart';
import '../modules/introduccion/login/bindings/login_binding.dart';
import '../modules/introduccion/login/views/login_view.dart';
import '../modules/introduccion/registrarse/bindings/registrarse_binding.dart';
import '../modules/introduccion/registrarse/views/registrarse_view.dart';
import '../modules/listapacientes/bindings/listapacientes_binding.dart';
import '../modules/listapacientes/views/listapacientes_view.dart';
import '../modules/principal/Detalles/bindings/detalles_binding.dart';
import '../modules/principal/Detalles/views/detalles_view.dart';
import '../modules/principal/ajustespt/bindings/ajustespt_binding.dart';
import '../modules/principal/ajustespt/views/ajustespt_view.dart';
import '../modules/principal/createpacientes/bindings/createpacientes_binding.dart';
import '../modules/principal/createpacientes/views/createpacientes_view.dart';
import '../modules/principal/editarpacientes/bindings/editarpacientes_binding.dart';
import '../modules/principal/editarpacientes/views/editarpacientes_view.dart';
import '../modules/principal/home/bindings/home_binding.dart';
import '../modules/principal/home/views/home_view.dart';
import '../modules/principal/listademedicaN/bindings/listademedica_n_binding.dart';
import '../modules/principal/listademedicaN/views/listademedica_n_view.dart';
import '../modules/principal/listalarmas/bindings/listalarmas_binding.dart';
import '../modules/principal/listalarmas/views/listalarmas_view.dart';
import '../modules/principal/registrarmedicamentos/bindings/registrarmedicamentos_binding.dart';
import '../modules/principal/registrarmedicamentos/views/registrarmedicamentos_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LISTALARMAS,
      page: () => const ListalarmasView(),
      binding: ListalarmasBinding(),
    ),
    GetPage(
      name: _Paths.CREATEPACIENTES,
      page: () => const CreatepacientesView(),
      binding: CreatepacientesBinding(),
    ),
    GetPage(
      name: _Paths.AJUSTESPT,
      page: () => const AjustesptView(),
      binding: AjustesptBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRARMEDICAMENTOS,
      page: () => const RegistrarmedicamentosView(),
      binding: RegistrarmedicamentosBinding(),
    ),
    GetPage(
      name: _Paths.LISTADEMEDICA_N,
      page: () => const ListademedicaNView(),
      binding: ListademedicaNBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRARSE,
      page: () => const RegistrarseView(),
      binding: RegistrarseBinding(),
    ),
    GetPage(
      name: _Paths.DETALLES,
      page: () => const DetallesView(),
      binding: DetallesBinding(),
    ),
    GetPage(
      name: _Paths.EDITARPACIENTES,
      page: () => const EditarpacientesView(),
      binding: EditarpacientesBinding(),
    ),
    GetPage(
      name: _Paths.LISTAPACIENTES,
      page: () => const ListapacientesView(),
      binding: ListapacientesBinding(),
    ),
  ];
}
