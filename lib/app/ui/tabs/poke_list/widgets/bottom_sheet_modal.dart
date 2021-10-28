import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';

class CustomBottomSheetModal extends StatelessWidget {
  const CustomBottomSheetModal(
      {Key? key,
      required this.pokeListController,
      required this.detailsList,
      required this.detailText,
      required this.index})
      : super(key: key);

  final PokeListController pokeListController;
  final List detailsList;
  final String detailText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        decoration: const BoxDecoration(
            color: Color(0xFF048ABF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  pokeListController.listaPokemons[index].pokemonCriado
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.file(
                              pokeListController.listaPokemons[index].imagem,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Image.network(
                          pokeListController.listaPokemons[index].urlImage,
                        ),
                  SizedBox(
                    height: 76,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pokeListController.listaPokemons[index].name,
                                  style: GoogleFonts.robotoMono(
                                    textStyle: const TextStyle(fontSize: 18),
                                  )),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(onTap: () {
                                    pokeListController
                                        .setPokemonFavorito(index);
                                  }, child: GetBuilder<PokeListController>(
                                    builder: (controller) {
                                      return pokeListController
                                              .listaPokemons[index].favorito
                                          ? const Icon(Icons.star,
                                              color: Colors.yellow)
                                          : const Icon(Icons.star_outline);
                                    },
                                  )))
                            ]),
                        Text(pokeListController.listaPokemons[index].tipo,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.robotoMono(
                              textStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            )),
                        Text(
                            pokeListController.listaPokemons[index].habilidades,
                            style: GoogleFonts.robotoMono(
                              textStyle: const TextStyle(fontSize: 12),
                            )),
                        pokeListController.listaPokemons[index].pokemonCriado
                            ? Text(pokeListController
                                .listaPokemons[index].categoria)
                            : Text(detailsList[0],
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.robotoMono(
                                  textStyle: const TextStyle(fontSize: 12),
                                )),
                      ],
                    ),
                  )
                ],
              ),
              pokeListController.listaPokemons[index].pokemonCriado
                  ? Text(pokeListController.listaPokemons[index].descricao)
                  : Text(detailText,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.robotoMono(
                        textStyle: const TextStyle(fontSize: 12),
                      )),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 15, 50, 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(70, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Gotta Get em all',
                      style: GoogleFonts.robotoMono(
                        textStyle: const TextStyle(fontSize: 12),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
