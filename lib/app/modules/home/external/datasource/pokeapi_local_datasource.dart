// import 'dart:convert';

// import '../../infrastructure/model/pokemon_model.dart';

// abstract class PokeapiLocalDataSource {
//   Future<void> addFavoritePokemon(PokemonModel pokemonModel);
//   Future<void> getFavoritePokemon(PokemonModel pokemonModel);
//   Future<void> removeFavoritePokemon(PokemonModel pokemonModel);
// }

// class PokeapiLocalDataSourceImpl implements PokeapiLocalDataSource {
//   final SharedPreferences prefs;

//   PokeapiLocalDataSourceImpl(this.prefs);

//   @override
//   Future<PokemonModel> getLastPokemon() {
//     final result = prefs.getString('pokemon');

//     if (result != null) {
//       return Future.value(PokemonModel.fromJson(jsonDecode(result)));
//     } else {
//       throw CacheException();
//     }
//   }

//   @override
//   Future<void> cachePokemon(PokemonModel pokemonModel) async {
//     return await prefs.setString('pokemon', jsonEncode(pokemonModel.toJson()));
//   }
// }
