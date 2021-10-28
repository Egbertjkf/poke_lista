import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_lista/app/data/model/pokemon_model.dart';

const apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

class PokeApiClient {
  final http.Client httpClient;

  PokeApiClient({required this.httpClient});

  getAllPokemons() async {
    var pokemonDataId;
    List<Pokemon> pokeList = [];
    try {
      for (var i = 1; i < 16; i++) {
        var res = await http.get(Uri.parse(apiUrl + i.toString() + '/'));
        pokemonDataId = jsonDecode(res.body);
        Pokemon pokemon = Pokemon(
            id: i,
            name: pokemonDataId['name'],
            urlImage: pokemonDataId["sprites"]["front_default"],
            habilidades: pokemonDataId['abilities'][0]['ability']['name'],
            tipo: pokemonDataId['types'][0]['type']['name'],
            detailsLink: pokemonDataId['species']['url']);
        pokeList.add(pokemon);
      }
      var lista = pokeList;
      return lista;
    } catch (e) {
      print(e.toString());
      //return [];
    }
  }

  getPokemonDetails(String url) async {
    var res = await http.get(Uri.parse(url));
    var pokemonDataId = jsonDecode(res.body);
    return [
      pokemonDataId['egg_groups'][0]['name'],
      pokemonDataId['flavor_text_entries'][0]['flavor_text']
    ];
  }

  getHabilidades() async {
    List<String> listaHabilidades = [];
    var res = await http.get(Uri.parse('https://pokeapi.co/api/v2/ability/'));
    var pokemonDataId = jsonDecode(res.body);
    for (var item in pokemonDataId['results'].toList()) {
      listaHabilidades.add(item['name']);
    }
    return listaHabilidades;
  }

  getTipos() async {
    List<String> listaTipos = [];
    var res = await http.get(Uri.parse('https://pokeapi.co/api/v2/type/'));
    var pokemonDataId = jsonDecode(res.body);
    for (var item in pokemonDataId['results'].toList()) {
      listaTipos.add(item['name']);
    }
    return listaTipos;
  }

  getCategoria() async {
    List<String> listaCategoria = [];
    var res = await http.get(Uri.parse('https://pokeapi.co/api/v2/egg-group/'));
    var pokemonDataId = jsonDecode(res.body);
    for (var item in pokemonDataId['results'].toList()) {
      listaCategoria.add(item['name']);
    }
    return listaCategoria;
  }
}
