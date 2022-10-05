import 'dart:math';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_connect.dart';
import '../../domain/entities/pokemon.dart';
import '../../external/datasource/pokeapi_remote_datasource.dart';

abstract class PokeapiRepository {
  Future<Either<Failure, Pokemon>> getConcretePokemon(int number);
  Future<Either<Failure, Pokemon>> getRandomPokemon();
}

class PokeapiRepositoryImpl implements PokeapiRepository {
  final PokeapiRemoteDataSource remoteDataSource;
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
    return await _getConcreteOrRandomPokemon(number);
  }

  @override
  Future<Either<Failure, Pokemon>> getRandomPokemon() async {
    return await _getConcreteOrRandomPokemon(random.nextInt(898));
  }

  Future<Either<Failure, Pokemon>> _getConcreteOrRandomPokemon(
    int number,
  ) async {
    if (await networkConnect.isConnected) {
      try {
        final result = await remoteDataSource.getPokemon(number);
        return Right(result);
      } on ServerException catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
