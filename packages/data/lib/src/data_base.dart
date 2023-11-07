import 'package:data/src/models/pokemon/pokemon_model.dart';
import 'package:faker/faker.dart';

abstract class PokemonApi {
  Future<List<PokemonModel>> pokemonList({int page = 1});

  Future<PokemonModel> pokemonDetail({required int id});
}

class StubbedPokemonApi extends PokemonApi {
  final List<PokemonModel> _stubbedData;
  static const int _pageSize = 20; // Example page size

  StubbedPokemonApi() : _stubbedData = _generateStubData(Faker());

  static List<PokemonModel> _generateStubData(Faker faker) {
    // Generate a list of stubbed PokemonModel objects for testing
    return List.generate(
      112,
      (index) {
        // Generate random types for each Pokemon
        var types = [
          'Grass',
          'Poison',
          'Fire',
          'Flying',
          'Water',
          'Bug',
          'Normal'
        ];
        List<String> randomTypes = faker.randomGenerator
            .amount((_) => faker.randomGenerator.element(types), 4, min: 2);

        // Generate random abilities for each Pokemon
        List<String> randomAbilities = faker.randomGenerator.amount(
            (_) => faker.lorem.word(),
            faker.randomGenerator.integer(6, min: 3));

        // Generate random stats for each Pokemon
        Map<String, int> randomStats = {
          'speed': faker.randomGenerator.integer(100),
          'attack': faker.randomGenerator.integer(100),
          'defense': faker.randomGenerator.integer(100),
          'specialAttack': faker.randomGenerator.integer(100),
          'specialDefense': faker.randomGenerator.integer(100),
          'hp': faker.randomGenerator.integer(100),
        };

        return PokemonModel(
            id: index + 1,
            name: faker.animal.name(),
            weight: '${faker.randomGenerator.decimal(min: 0.1, scale: 100)} kg',
            height: '${faker.randomGenerator.decimal(min: 0.1, scale: 100)} cm',
            generation:
                'Generation ${faker.randomGenerator.integer(8, min: 1)}',
            imageUrl: faker.image.image(random: true),
            type: randomTypes,
            abilities: randomAbilities,
            baseExperience: faker.randomGenerator.integer(300, min: 10),
            stats: randomStats);
      },
    );
  }

  @override
  Future<List<PokemonModel>> pokemonList({int page = 1}) async {
    // Implementing pagination
    final startIndex = (page - 1) * _pageSize;
    final endIndex = startIndex + _pageSize;

    // Returning a sublist as a simulated 'page' of results
    List<PokemonModel> pageItems = _stubbedData.sublist(
      startIndex,
      endIndex > _stubbedData.length ? _stubbedData.length : endIndex,
    );

    // Simulating network delay
    await Future.delayed(Duration(seconds: 2));
    return pageItems;
  }

  @override
  Future<PokemonModel> pokemonDetail({required int id}) async {
    // Finding a pokemon by id in the stubbed data
    final pokemon = _stubbedData.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Pokemon not found'),
    );

    // Simulating network delay
    await Future.delayed(Duration(seconds: 1));
    return pokemon;
  }
}
