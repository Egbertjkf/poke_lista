import 'package:poke_lista/app/data/provider/poke_api.dart';

class PokeRepository {
  final PokeApiClient apiClient;

  PokeRepository({required this.apiClient});

  getAll() {
    return apiClient.getAllPokemons();
  }

  getPokemonDetails(String url) async {
    return await apiClient.getPokemonDetails(url);
  }

  getHabilidades() async {
    return await apiClient.getHabilidades();
  }

  getTipo() async {
    return await apiClient.getTipos();
  }

  getCategoria() async {
    return await apiClient.getCategoria();
  }
}
