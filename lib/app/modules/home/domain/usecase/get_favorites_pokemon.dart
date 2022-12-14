import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/repository/pokeapi_repository_contract.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class GetFavoritesPokemonContract {
  Future<Either<Failure, List<Pokemon>>> call(int offset, int limit);
}

class GetFavoritesPokemonImpl implements GetFavoritesPokemonContract {
  final PokeapiRepositoryContract repository;

  GetFavoritesPokemonImpl(this.repository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(int offset, int limit) async {
    return await repository.getFavoritesPokemon(offset, limit);
  }
}
