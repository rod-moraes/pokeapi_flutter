import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/entities/pokemon.dart';
import '../../infra/datasource/pokeapi_local_datasource_contract.dart';

class PokeapiLocalDataSourceImpl extends PokeapiLocalDataSourceContract {
  Box<Pokemon> get _pokemonDb => Hive.box<Pokemon>('pokemonDb');

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PokemonAdapter());
    await Hive.openBox<Pokemon>('pokemonDb');
  }

  @override
  Future<void> clearCache() async {
    try {
      await Hive.deleteFromDisk();
    } catch (e) {
      throw LocalException();
    }
  }

  @override
  Future<bool> inPokemonDb(int id) async {
    return (_pokemonDb).containsKey(id);
  }

  @override
  Future<List<Pokemon>> getListPokemon() async {
    List<Pokemon> pokemons = (_pokemonDb).toMap().values.toList();
    if (pokemons != null) {
      return pokemons;
    } else {
      throw LocalException();
    }
  }

  @override
  Future<Pokemon> getPokemon(int id) async {
    Pokemon? pokemon = (_pokemonDb).get(id);
    if (pokemon != null) {
      return pokemon;
    } else {
      throw LocalException();
    }
  }

  @override
  Future<void> addPokemon(Pokemon pokemon) async {
    try {
      await (_pokemonDb).put(pokemon.id, pokemon);
    } catch (e) {
      throw LocalException();
    }
  }

  @override
  Future<void> removePokemon(Pokemon pokemon) async {
    try {
      await (_pokemonDb).delete(pokemon.id);
    } catch (e) {
      throw LocalException();
    }
  }
}
