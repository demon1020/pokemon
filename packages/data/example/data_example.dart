import 'package:data/data.dart';

void main() async {
  final PokemonApi pokemonApi = StubbedPokemonApi();

  final list = await pokemonApi.pokemonList(page: 6);

  print(list.last);

  final detail = await pokemonApi.pokemonDetail(id: list.last.id);

  print(detail);
}
