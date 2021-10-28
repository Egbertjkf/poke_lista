import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';
import 'package:poke_lista/app/ui/global_wigdets/animated_loading.dart';
import 'package:poke_lista/app/ui/tabs/poke_list/widgets/poke_list_view.dart';

class PokeList extends StatelessWidget {
  PokeList({Key? key}) : super(key: key);
  final PokeListController pokeListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              pokeListController.toggleFavoritos();
            }, icon: Obx(() {
              return pokeListController.mostrarFavoritos
                  ? const Icon(Icons.star, color: Colors.yellow)
                  : const Icon(Icons.star_outline);
            }))
          ],
          backgroundColor: const Color(0xFFD94A4A),
          title: Center(
            child: Text('POKELISTA',
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  textStyle: const TextStyle(fontSize: 18),
                )),
          ),
        ),
        body: GetBuilder<PokeListController>(builder: (controller) {
          return pokeListController.listaPokemons.length == 0
              ? const Center(child: PokeballLoading())
              : PokeListView();
        }));
  }
}
