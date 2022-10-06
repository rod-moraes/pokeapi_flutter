import 'package:mobx/mobx.dart';
import 'package:async/async.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/usecase/get_favorites_pokemon.dart';
import '../../domain/usecase/get_list_pokemon.dart';
import '../states/list_pokemon_state.dart';

part 'list_pokemon_store.g.dart';

class ListPokemonStore = _ListPokemonStoreBase with _$ListPokemonStore;

abstract class _ListPokemonStoreBase with Store {
  final GetListPokemonContract usecase;
  final GetFavoritesPokemonContract usecaseFavorite;
  CancelableOperation? cancellableOperation;

  @observable
  bool isFavorite = false;

  _ListPokemonStoreBase(this.usecase, this.usecaseFavorite) {
    reaction((_) => offset, (offset) async {
      stateReaction(offset, cancellableOperation);
    }, delay: 500);
    reaction((_) => isFavorite, (isFavorite) async {
      stateReaction(offset, cancellableOperation);
    }, delay: 500);
  }

  Future stateReaction(int offset,
      [CancelableOperation? cancellableOperation]) async {
    await cancellableOperation?.cancel();
    cancellableOperation = CancelableOperation<ListPokemonState>.fromFuture(
        listPokemonOffset(offset));
    setState(const LoadingState());
    setState(
        await cancellableOperation.valueOrCancellation(const LoadingState()));
  }

  Future<ListPokemonState> listPokemonOffset(int value) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var result =
        isFavorite ? await usecaseFavorite(value, 6) : await usecase(value, 6);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @observable
  int offset = -1;

  @observable
  ListPokemonState state = const StartState();

  @action
  void setFavorite(bool favorite) {
    if (state is! LoadingState) {
      isFavorite = favorite;
    }
  }

  @action
  void setOffset(int value) {
    if (value >= 0 && state is! LoadingState) {
      offset = value;
    }
  }

  @action
  void setState(ListPokemonState value) => state = value;
}
