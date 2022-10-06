import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:pokeapi_flutter/app/modules/home/infra/datasource/pokeapi_local_datasource_contract.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_connect.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repository/pokeapi_repository_contract.dart';
import '../datasource/pokeapi_remote_datasource_contract.dart';

class PokeapiRepositoryImpl implements PokeapiRepositoryContract {
  final PokeapiRemoteDataSourceContract remoteDataSource;
  final PokeapiLocalDataSourceContract localDataSource;
  final NetworkConnect networkConnect;
  final Random random;

  const PokeapiRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.random,
    required this.networkConnect,
  });

  @override
  Future<Either<Failure, Pokemon>> getConcretePokemon(int number) async {
    return await _getConcreteOrRandomPokemon(number.toString());
  }

  @override
  Future<Either<Failure, Pokemon>> getRandomPokemon() async {
    return await _getConcreteOrRandomPokemon(random.nextInt(898).toString());
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getListPokemon(
      int offset, int limit) async {
    if (await networkConnect.isConnected) {
      try {
        final list = await remoteDataSource.getListPokemon(offset, limit);
        final listPokemon = await Stream.fromIterable(list).asyncMap((e) async {
          final pokemon = await remoteDataSource.getPokemon(e);
          final isFavorite = await localDataSource.inPokemonDb(pokemon.id);
          return pokemon.copyWith(isFavorite: isFavorite);
        }).toList();
        return Right(listPokemon);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Pokemon>> _getConcreteOrRandomPokemon(
    String search,
  ) async {
    if (await networkConnect.isConnected) {
      try {
        final pokemon = await remoteDataSource.getPokemon(search);
        final isFavorite = await localDataSource.inPokemonDb(pokemon.id);
        final result = pokemon.copyWith(isFavorite: isFavorite);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getFavoritesPokemon(
      int offset, int limit) async {
    try {
      final result = await localDataSource.getListPokemon(offset, limit);
      return Right(result);
    } on LocalException {
      return const Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoritePokemon(Pokemon pokemon) async {
    try {
      final result = await localDataSource.removePokemon(pokemon);
      return Right(result);
    } on LocalException {
      return const Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setFavoritePokemon(Pokemon pokemon) async {
    try {
      final result = await localDataSource.addPokemon(pokemon);
      return Right(result);
    } on LocalException {
      return const Left(LocalFailure());
    }
  }
}
