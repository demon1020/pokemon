import 'package:data/data.dart';
import 'package:data/src/models/pokemon/pokemon_model.dart';

class PokemonRepository {
  final PokemonApi _pokemonApi;
  PokemonRepository(this._pokemonApi);

  Future<List<PokemonModel>> fetchPokemonList() async {
    try{
      final List<PokemonModel> pokemonList = await _pokemonApi.pokemonList();
      return pokemonList;
    } catch(e){
      print(e);
      throw "Failed to get Pokemons";
    }
  }

  Future<PokemonModel> fetchPokemonWithId({required int id}) async {
    try{
      final PokemonModel pokemon = await _pokemonApi.pokemonDetail(id: id);
      return pokemon;
    } catch(e){
      print(e);
      throw "Failed to get Pokemon";
    }
  }
}