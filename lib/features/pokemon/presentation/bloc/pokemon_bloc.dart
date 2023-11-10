import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:data/src/models/pokemon/pokemon_model.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon_state.dart';
import '../../domain/repositories/pokemon_repository.dart';
import './pokemon_event.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  PokemonBloc() : super(PokemonState.initial()) {

    on<FetchPokemonEvent>((event, emit) async {
      emit(PokemonState.loading());
      PokemonApi pokemonApi = StubbedPokemonApi();
      final PokemonRepository _pokemonRepository = PokemonRepository(pokemonApi);
      List<PokemonModel> pokemons = await _pokemonRepository.fetchPokemonList();
      emit(PokemonState.success(pokemons));
    });

    on<FetchPokemonByIdEvent>((event, emit) async {
      emit(PokemonState.loading());
      PokemonApi pokemonApi = StubbedPokemonApi();
      final PokemonRepository _pokemonRepository = PokemonRepository(pokemonApi);
      PokemonModel pokemon = await _pokemonRepository.fetchPokemonWithId(id: event.pokemonId);
      emit(PokemonState.success([pokemon]));
    });

  }
}
