import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class PokeapiRepositoryContract {
  Future<Either<Failure, Pokemon>> getConcretePokemon(int number);
  Future<Either<Failure, Pokemon>> getRandomPokemon();
  Future<Either<Failure, List<Pokemon>>> getListPokemon(int offset, int limit);
}
