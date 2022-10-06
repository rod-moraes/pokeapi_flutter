import 'package:mobx/mobx.dart';
import 'package:async/async.dart';
import '../../domain/usecase/get_list_pokemon.dart';
import '../states/list_pokemon_state.dart';

part 'list_pokemon_store.g.dart';

class ListPokemonStore = _ListPokemonStoreBase with _$ListPokemonStore;

abstract class _ListPokemonStoreBase with Store {
  final GetListPokemonContract usecase;
  CancelableOperation? cancellableOperation;

  _ListPokemonStoreBase(this.usecase) {
    reaction((_) => offset, (offset) async {
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
    var result = await usecase(value, 6);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @observable
  int offset = -1;

  @observable
  ListPokemonState state = const StartState();

  @action
  void setOffset(int value) {
    if (value >= 0) {
      offset = value;
    }
  }

  @action
  void setState(ListPokemonState value) => state = value;
}
