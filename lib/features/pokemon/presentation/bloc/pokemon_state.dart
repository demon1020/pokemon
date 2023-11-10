import 'package:data/src/models/pokemon/pokemon_model.dart';

class PokemonState {
  final List<PokemonModel> pokemonList;
  final bool isLoading;
  final bool hasError;

  const PokemonState({
    this.pokemonList = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  factory PokemonState.initial() => const PokemonState();

  factory PokemonState.loading() => const PokemonState(isLoading: true);

  factory PokemonState.success(List<PokemonModel> pokemonList) => PokemonState(
    pokemonList: pokemonList,
    isLoading: false,
  );

  factory PokemonState.failure() => const PokemonState(
    hasError: true,
    isLoading: false,
  );
}