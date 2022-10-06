import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokeapi_flutter/app/modules/home/infra/datasource/pokeapi_local_datasource_contract.dart';
import 'package:translator/translator.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../infra/model/pokemon_model.dart';

class PokeapiRemoteDataSourceImpl implements PokeapiRemoteDataSourceContract {
  final http.Client client;
  final translator = GoogleTranslator();

  PokeapiRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonModel> getPokemon(String search) async {
    final result = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$search'));
    final resultSpecies = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$search'));

    if (result.statusCode == 200 && resultSpecies.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(result.body);
      json.addAll(jsonDecode(resultSpecies.body));
      final text = json['flavor_text_entries'][0]['flavor_text']
              ?.toString()
              .replaceAll('\n', ' ') ??
          '';
      final translate = await translator.translate(text, to: 'pt');
      json['flavor_text_entries'][0]['flavor_text'] = translate.text;
      return PokemonModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getListPokemon(int offset, int limit) async {
    final result = await client.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
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
