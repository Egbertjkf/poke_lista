import 'package:get/get.dart';
import 'package:poke_lista/app/controller/cadastro_controller.dart';
import 'package:poke_lista/app/controller/nav_bar_controller.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';
import 'package:poke_lista/app/data/provider/poke_api.dart';
import 'package:poke_lista/app/data/repository/poke_repository.dart';
import 'package:http/http.dart' as http;

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokeApiClient(httpClient: http.Client()));
    Get.lazyPut(() => PokeRepository(apiClient: Get.find<PokeApiClient>()));

    Get.lazyPut<BottomNavBarController>(() {
      return BottomNavBarController();
    });
    Get.lazyPut<PokeListController>(() {
      return PokeListController(pokeRepository: Get.find<PokeRepository>());
    });
    Get.lazyPut<CadastroContoller>(() {
      return CadastroContoller();
    });
  }
}
