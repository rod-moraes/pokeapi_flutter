import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../infrastructure/model/pokemon_model.dart';

abstract class PokeapiRemoteDataSource {
  Future<PokemonModel> getPokemon(int number);
  Future<List<String>> getListPokemon(int offset, int limit);
}

class PokeapiRemoteDataSourceImpl implements PokeapiRemoteDataSource {
  final http.Client client;

  PokeapiRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonModel> getPokemon(int number) async {
    final result = await client
        .get(Uri(path: 'https://pokeapi.co/api/v2/pokemon/$number'));

    if (result.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(result.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getListPokemon(int offset, int limit) async {
    final result = await client.get(
      Uri(
        path: 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
      ),
    );

    if (result.statusCode == 200) {
      final body = jsonDecode(result.body);
      final results = body["results"] as List;
      return results.map((e) => e["name"] as String).toList();
    } else {
      throw ServerException();
    }
  }
}
