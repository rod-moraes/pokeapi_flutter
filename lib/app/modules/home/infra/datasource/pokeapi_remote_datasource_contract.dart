import 'package:pokeapi_flutter/app/modules/home/infra/model/pokemon_model.dart';

abstract class PokeapiRemoteDataSourceContract {
  Future<PokemonModel> getPokemon(String search);
  Future<List<String>> getListPokemon(int offset, int limit);
}
