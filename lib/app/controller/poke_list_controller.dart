import 'package:get/get.dart';
import 'package:poke_lista/app/data/model/pokemon_model.dart';
import 'package:poke_lista/app/data/repository/poke_repository.dart';

class PokeListController extends GetxController {
  final PokeRepository pokeRepository;
  PokeListController({required this.pokeRepository});
  final List<Pokemon> _listaPokemons = [];
  final _mostrarFavoritos = false.obs;

  get mostrarFavoritos => _mostrarFavoritos.value;
  set mostrarFavoritos(data) => _mostrarFavoritos.value = data;

  get listaPokemons => _listaPokemons;
  set listaPokemons(data) => _listaPokemons;
  @override
  onInit() {
    super.onInit();
    getListFromApi();
  }

  getListFromApi() async {
    var retApi = await pokeRepository.getAll();
    for (var pokemon in retApi) {
      _listaPokemons.add(pokemon);
    }
    update();
  }

  getPokemonDetails(String url) {
    return pokeRepository.getPokemonDetails(url);
  }

  toggleFavoritos() {
    mostrarFavoritos = !mostrarFavoritos;
    update();
  }

  setPokemonFavorito(index) {
    listaPokemons[index].favorito = !listaPokemons[index].favorito;
    update();
  }

  addNovoPokemon(Pokemon novoPokemon) {
    int maiorId = 0;
    for (var pokemon in listaPokemons) {
      if (pokemon.id > maiorId) maiorId = pokemon.id;
    }
    novoPokemon.id = maiorId;
    listaPokemons.add(novoPokemon);
    update();
  }
}
