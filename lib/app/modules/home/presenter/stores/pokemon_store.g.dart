// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStoreBase, Store {
  late final _$idPokemonAtom =
      Atom(name: '_PokemonStoreBase.idPokemon', context: context);

  @override
  int? get idPokemon {
    _$idPokemonAtom.reportRead();
    return super.idPokemon;
  }

  @override
  set idPokemon(int? value) {
    _$idPokemonAtom.reportWrite(value, super.idPokemon, () {
      super.idPokemon = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_PokemonStoreBase.state', context: context);

  @override
  PokemonState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(PokemonState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase', context: context);

  @override
  void setIdPokemon(int? value) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setIdPokemon');
    try {
      return super.setIdPokemon(value);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(PokemonState value) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idPokemon: ${idPokemon},
state: ${state}
    ''';
  }
}
