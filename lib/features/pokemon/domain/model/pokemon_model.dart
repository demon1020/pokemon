import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel{
  const factory PokemonModel({
    required int id,
    required String name,
    required String weight,
    required String height,
    required String generation,
    required String imageUrl,
    required List<String> type,
    required List<String> abilities,
    required int baseExperience,
    required Map<String, int> stats,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, Object?> json) => _$PokemonModelFromJson(json);
}