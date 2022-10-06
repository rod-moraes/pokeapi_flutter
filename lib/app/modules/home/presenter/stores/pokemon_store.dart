import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:async/async.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/usecase/get_random_pokemon.dart';
import '../../domain/usecase/get_pokemon.dart';
import '../states/pokemon_state.dart';

part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final GetPokemonContract usecasePokemon;
  final GetRandomPokemonContract usecaseRandomPokemon;
  CancelableOperation? cancellableOperation;

  _PokemonStoreBase(this.usecasePokemon, this.usecaseRandomPokemon) {
    reaction((_) => idPokemon, (offset) async {
      stateReaction(offset, cancellableOperation);
    }, delay: 500);
  }

  Future stateReaction(int? idPokemon,
      [CancelableOperation? cancellableOperation]) async {
    await cancellableOperation?.cancel();
    if (idPokemon != null) {
      cancellableOperation =
          CancelableOperation<PokemonState>.fromFuture(pokemonGet(idPokemon));
    } else {
      cancellableOperation =
          CancelableOperation<PokemonState>.fromFuture(pokemonGetRandom());
    }
    setState(const LoadingState());
    setState(
        await cancellableOperation.valueOrCancellation(const LoadingState()));
  }

  Future<PokemonState> pokemonGet(int value) async {
    var result = await usecasePokemon(value);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  Future<PokemonState> pokemonGetRandom() async {
    var result = await usecaseRandomPokemon();
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @observable
  int? idPokemon;

  @observable
  PokemonState state = const StartState();

  @action
  void setIdPokemon(int? value) {
    value ??= Random().nextInt(100);
    idPokemon = value;
  }

  @action
  void setState(PokemonState value) => state = value;
}
