import '../../domain/entities/pokemon.dart';

abstract class PokeapiLocalDataSourceContract {
  Future<void> init();
  Future<void> clearCache();
  Future<bool> inPokemonDb(int id);
  Future<List<Pokemon>> getListPokemon();
  Future<Pokemon> getPokemon(int id);
  Future<void> addPokemon(Pokemon pokemon);
  Future<void> removePokemon(Pokemon pokemon);
}
