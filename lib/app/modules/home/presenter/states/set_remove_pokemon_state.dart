import '../../../../../core/errors/failures.dart';

abstract class SetRemovePokemonState {}

class StartState implements SetRemovePokemonState {
  const StartState();
}

class LoadingState implements SetRemovePokemonState {
  const LoadingState();
}

class ErrorState implements SetRemovePokemonState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SetRemovePokemonState {
  const SuccessState();
}
