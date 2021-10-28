import 'package:get/get.dart';
import 'package:poke_lista/app/ui/home.dart';
import 'package:poke_lista/app/ui/tabs/cadastro/cadastro.dart';
import 'package:poke_lista/app/ui/tabs/dashboard/dashboard.dart';
import 'package:poke_lista/app/ui/tabs/poke_list/poke_list.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(name: Routes.CADASTRO, page: () => Cadastro()),
    GetPage(name: Routes.DASHBOARD, page: () => DashBoard()),
    GetPage(
      name: Routes.LISTA,
      page: () => PokeList(),
    )
  ];
}
