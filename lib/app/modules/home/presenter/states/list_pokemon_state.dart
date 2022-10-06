import 'package:pokeapi_flutter/app/modules/home/domain/entities/pokemon.dart';

import '../../../../../core/errors/failures.dart';

abstract class ListPokemonState {}

class StartState implements ListPokemonState {
  const StartState();
}

class LoadingState implements ListPokemonState {
  const LoadingState();
}

class ErrorState implements ListPokemonState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements ListPokemonState {
  final List<Pokemon> list;
  const SuccessState(this.list);
}
