import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';
import 'package:poke_lista/app/ui/tabs/poke_list/widgets/bottom_sheet_modal.dart';
import 'package:poke_lista/app/ui/tabs/poke_list/widgets/poke_list_favoritos.dart';

class PokeListView extends StatelessWidget {
  const PokeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeListController pokeListController = Get.find();

    return ListView.builder(
      itemCount: pokeListController.listaPokemons.length,
      itemBuilder: (context, index) {
        return pokeListController.mostrarFavoritos
            ? PokeListFav(
                index: index,
                pokeListController: pokeListController,
              )
            : Column(
                children: [
                  ListTile(
                    onTap: () async {
                      String detailText = '';
                      List<dynamic> detailsList = [];
                      if (!pokeListController
                          .listaPokemons[index].pokemonCriado) {
                        detailsList = await pokeListController
                            .getPokemonDetails(pokeListController
                                .listaPokemons[index].detailsLink);
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
                      child: pokeListController
                              .listaPokemons[index].pokemonCriado
                          ? Image.file(
                              pokeListController.listaPokemons[index].imagem,
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              pokeListController.listaPokemons[index].urlImage,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  const Divider()
                ],
              );
      },
    );
  }
}
