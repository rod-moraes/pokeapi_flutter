import 'dart:math';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_connect.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repository/pokeapi_repository_contract.dart';
import '../datasource/pokeapi_local_datasource_contract.dart';

class PokeapiRepositoryImpl implements PokeapiRepositoryContract {
  final PokeapiRemoteDataSourceContract remoteDataSource;
  // final PokeapiLocalDataSource localDataSource;
  final NetworkConnect networkConnect;
  final Random random;

  const PokeapiRepositoryImpl({
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
        final listPokemon = await Stream.fromIterable(list)
            .asyncMap((e) => remoteDataSource.getPokemon(e))
            .toList();
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
        final result = await remoteDataSource.getPokemon(search);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
