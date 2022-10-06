import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/repository/pokeapi_repository_contract.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class GetPokemonContract {
  Future<Either<Failure, Pokemon>> call(int number);
}

class GetPokemonImpl implements GetPokemonContract {
  final PokeapiRepositoryContract repository;

  GetPokemonImpl(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(int number) async {
    return await repository.getConcretePokemon(number);
  }
}
