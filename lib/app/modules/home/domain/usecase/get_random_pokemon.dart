import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/repository/pokeapi_repository_contract.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class GetRandomPokemonContract {
  Future<Either<Failure, Pokemon>> call();
}

class GetRandomPokemonImpl implements GetRandomPokemonContract {
  final PokeapiRepositoryContract repository;

  GetRandomPokemonImpl(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call() async {
    return await repository.getRandomPokemon();
  }
}
