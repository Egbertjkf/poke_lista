import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';

import 'bottom_sheet_modal.dart';

class PokeListFav extends StatelessWidget {
  const PokeListFav(
      {Key? key, required this.pokeListController, required this.index})
      : super(key: key);
  final PokeListController pokeListController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return pokeListController.listaPokemons[index].favorito
        ? Column(
            children: [
              ListTile(
                onTap: () async {
                  String detailText = '';
                  List<dynamic> detailsList = [];
                  if (!pokeListController.listaPokemons[index].pokemonCriado) {
                    detailsList = await pokeListController.getPokemonDetails(
                        pokeListController.listaPokemons[index].detailsLink);
                    List stringListDetail = detailsList[1].split("\n");
                    for (var strings in stringListDetail) {
                      detailText += strings;
                    }
                  }

                  Get.bottomSheet(CustomBottomSheetModal(
                      pokeListController: pokeListController,
                      detailsList: detailsList,
                      index: index,
                      detailText: detailText));
                },
                title: Row(children: [
                  Text(pokeListController.listaPokemons[index].name),
                  pokeListController.listaPokemons[index].favorito
                      ? const Icon(Icons.star, color: Colors.yellow)
                      : const Icon(Icons.star_outline)
                ]),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                subtitle: Text(
                    '#${pokeListController.listaPokemons[index].id.toString()}'),
                leading: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                      color: Color(0xFF048ABF), shape: BoxShape.circle),
                  child: pokeListController.listaPokemons[index].pokemonCriado
                      ? pokeListController.listaPokemons[index].imagem != null
                          ? Image.file(
                              pokeListController.listaPokemons[index].imagem,
                              fit: BoxFit.fill,
                            )
                          : Image.asset("assets/pokeball.png")
                      : Image.network(
                          pokeListController.listaPokemons[index].urlImage,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              const Divider()
            ],
          )
        : Container();
  }
}
