import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/repository/pokeapi_repository_contract.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/pokemon.dart';

abstract class SetFavoritePokemonContract {
  Future<Either<Failure, void>> call(Pokemon pokemon);
}

class SetFavoritePokemonImpl implements SetFavoritePokemonContract {
  final PokeapiRepositoryContract repository;

  SetFavoritePokemonImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(Pokemon pokemon) async {
    return await repository.setFavoritePokemon(pokemon);
  }
}
