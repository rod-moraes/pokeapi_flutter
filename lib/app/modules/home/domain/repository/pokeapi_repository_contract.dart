import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class PokeapiRepositoryContract {
  Future<Either<Failure, Pokemon>> getConcretePokemon(int number);
  Future<Either<Failure, Pokemon>> getRandomPokemon();
  Future<Either<Failure, List<Pokemon>>> getListPokemon(int offset, int limit);
  Future<Either<Failure, List<Pokemon>>> getFavoritesPokemon();
  Future<Either<Failure, void>> removeFavoritePokemon(Pokemon pokemon);
  Future<Either<Failure, void>> setFavoritePokemon(Pokemon pokemon);
}
