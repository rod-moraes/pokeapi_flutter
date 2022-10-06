// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritePokemonStore on _FavoritePokemonStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_FavoritePokemonStoreBase.state', context: context);

  @override
  SetRemovePokemonState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SetRemovePokemonState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_FavoritePokemonStoreBaseActionController =
      ActionController(name: '_FavoritePokemonStoreBase', context: context);

  @override
  void setState(SetRemovePokemonState value) {
    final _$actionInfo = _$_FavoritePokemonStoreBaseActionController
        .startAction(name: '_FavoritePokemonStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_FavoritePokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
