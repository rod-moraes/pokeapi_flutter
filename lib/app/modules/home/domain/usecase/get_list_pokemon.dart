import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/repository/pokeapi_repository_contract.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class GetListPokemonContract {
  Future<Either<Failure, List<Pokemon>>> call(int offset, int limit);
}

class GetListPokemonImpl implements GetListPokemonContract {
  final PokeapiRepositoryContract repository;

  GetListPokemonImpl(this.repository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(int offset, int limit) async {
    return await repository.getListPokemon(offset, limit);
  }
}
