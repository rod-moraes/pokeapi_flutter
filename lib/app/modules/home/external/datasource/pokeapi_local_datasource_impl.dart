import 'dart:async';

import 'package:hive/hive.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/entities/pokemon.dart';
import '../../infra/datasource/pokeapi_local_datasource_contract.dart';

class PokeapiLocalDataSourceImpl extends PokeapiLocalDataSourceContract {
  @override
  Future<void> init() async {}

  @override
  Future<void> clearCache() async {
    try {
      await Hive.deleteFromDisk();
      _pokemonDb = await Hive.openBox('pokemonDb');
    } catch (e) {
      throw LocalException();
    }
  }

  late Box<Pokemon> _pokemonDb;

  @override
  Future<bool> inPokemonDb(int id) async {
    return _pokemonDb.containsKey(id);
  }

  @override
  Future<List<Pokemon>> getListPokemon() async {
    List<Pokemon> pokemons = _pokemonDb.toMap().values.toList();
    if (pokemons != null) {
      return pokemons;
    } else {
      throw LocalException();
    }
  }

  @override
  Future<Pokemon> getPokemon(int id) async {
    Pokemon? pokemon = _pokemonDb.get(id);
    if (pokemon != null) {
      return pokemon;
    } else {
      throw LocalException();
    }
  }

  @override
  Future<void> addPokemon(Pokemon pokemon) async {
    try {
      await _pokemonDb.put(pokemon.id, pokemon);
    } catch (e) {
      throw LocalException();
    }
  }

  @override
  Future<void> removePokemon(Pokemon pokemon) async {
    try {
      await _pokemonDb.deleteAt(pokemon.id);
    } catch (e) {
      throw LocalException();
    }
  }
}
