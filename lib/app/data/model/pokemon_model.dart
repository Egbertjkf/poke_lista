import 'dart:io';

class Pokemon {
  int id;
  final String name;
  final String urlImage;
  final String? flavorText;
  final String? detailsLink;
  final String? tipo;
  final String? habilidades;
  final bool pokemonCriado;
  final File? imagem;
  final String? descricao;
  final String? categoria;
  bool favorito = false;

  Pokemon(
      {required this.id,
      required this.name,
      required this.urlImage,
      this.flavorText,
      this.detailsLink,
      this.tipo,
      this.habilidades,
      this.imagem,
      this.descricao,
      this.categoria,
      this.pokemonCriado = false});

  toggleFavorito() {
    favorito = !favorito;
  }
}
