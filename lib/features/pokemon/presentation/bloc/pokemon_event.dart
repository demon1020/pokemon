// pokemon_event.dart
import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

class FetchPokemonEvent extends PokemonEvent {}

class FetchPokemonByIdEvent extends PokemonEvent {
  final int pokemonId;

  const FetchPokemonByIdEvent({required this.pokemonId});

  @override
  List<Object?> get props => [pokemonId];
}
