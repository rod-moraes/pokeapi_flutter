import '../../../../../core/errors/failures.dart';
import '../../domain/entities/pokemon.dart';

abstract class PokemonState {}

class StartState implements PokemonState {
  const StartState();
}

class LoadingState implements PokemonState {
  const LoadingState();
}

class ErrorState implements PokemonState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements PokemonState {
  final Pokemon pokemon;
  const SuccessState(this.pokemon);
}
