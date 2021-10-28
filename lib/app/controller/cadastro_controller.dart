import 'dart:io';
import 'package:get/get.dart';
import 'package:poke_lista/app/controller/poke_list_controller.dart';
import 'package:poke_lista/app/data/model/pokemon_model.dart';
import 'package:poke_lista/app/data/repository/poke_repository.dart';

class CadastroContoller extends GetxController {
  List<String> categoria = [];
  List<String> tipo = [];
  List<String> habilidade = [];
  final repository = Get.find<PokeRepository>();
  File? imagemPokemon;

  // File? pokeImagem;
  @override
  onInit() {
    super.onInit();
    getCategoria();
    getTipo();
    getHabilidades();
  }

  getHabilidades() async {
    var ret = await repository.getHabilidades();
    habilidade = [...ret];
    update();
  }

  getTipo() async {
    var ret = await repository.getTipo();
    tipo = [...ret];
    update();
  }

  getCategoria() async {
    var ret = await repository.getCategoria();
    categoria = [...ret];
    update();
  }

  setImagemPokemon(File imagem) {
    imagemPokemon = imagem;
    update();
  }

  cadastraPokemon(name, habilidade, tipo, categoria, descricao) {
    var novoPokemon = Pokemon(
        id: 0,
        name: name,
        urlImage: '',
        tipo: tipo,
        habilidades: habilidade,
        descricao: descricao,
        categoria: categoria,
        imagem: imagemPokemon,
        pokemonCriado: true);
    Get.find<PokeListController>().addNovoPokemon(novoPokemon);
    imagemPokemon = null;
  }
}
