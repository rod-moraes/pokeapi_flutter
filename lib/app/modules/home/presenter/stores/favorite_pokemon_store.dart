import 'package:mobx/mobx.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/usecase/remove_favorite_pokemon.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecase/set_favorite_pokemon.dart';
import '../states/set_remove_pokemon_state.dart';

part 'favorite_pokemon_store.g.dart';

class FavoritePokemonStore = _FavoritePokemonStoreBase
    with _$FavoritePokemonStore;

abstract class _FavoritePokemonStoreBase with Store {
  final SetFavoritePokemonContract usecaseSet;
  final RemoveFavoritePokemonContract usecaseRemove;
  _FavoritePokemonStoreBase(this.usecaseSet, this.usecaseRemove);
  @observable
  SetRemovePokemonState state = const StartState();

  @action
  void setState(SetRemovePokemonState value) => state = value;

  Future<void> setFavoritePokemon(Pokemon pokemon) async {
    setState(const LoadingState());
    var result = await usecaseSet(pokemon);
    final state =
        result.fold((l) => ErrorState(l), (r) => const SuccessState());
    setState(state);
  }

  Future<void> removeFavoritePokemon(Pokemon pokemon) async {
    setState(const LoadingState());
    var result = await usecaseRemove(pokemon);
    final state =
        result.fold((l) => ErrorState(l), (r) => const SuccessState());
    setState(state);
  }
}
