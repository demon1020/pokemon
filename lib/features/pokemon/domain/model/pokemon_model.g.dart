// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonModelImpl _$$PokemonModelImplFromJson(Map<String, dynamic> json) =>
    _$PokemonModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      weight: json['weight'] as String,
      height: json['height'] as String,
      generation: json['generation'] as String,
      imageUrl: json['imageUrl'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
      baseExperience: json['baseExperience'] as int,
      stats: Map<String, int>.from(json['stats'] as Map),
    );

Map<String, dynamic> _$$PokemonModelImplToJson(_$PokemonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'generation': instance.generation,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'abilities': instance.abilities,
      'baseExperience': instance.baseExperience,
      'stats': instance.stats,
    };
