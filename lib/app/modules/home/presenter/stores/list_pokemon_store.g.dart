// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListPokemonStore on _ListPokemonStoreBase, Store {
  late final _$offsetAtom =
      Atom(name: '_ListPokemonStoreBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_ListPokemonStoreBase.state', context: context);

  @override
  ListPokemonState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ListPokemonState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_ListPokemonStoreBaseActionController =
      ActionController(name: '_ListPokemonStoreBase', context: context);

  @override
  void setOffset(int value) {
    final _$actionInfo = _$_ListPokemonStoreBaseActionController.startAction(
        name: '_ListPokemonStoreBase.setOffset');
    try {
      return super.setOffset(value);
    } finally {
      _$_ListPokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(ListPokemonState value) {
    final _$actionInfo = _$_ListPokemonStoreBaseActionController.startAction(
        name: '_ListPokemonStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_ListPokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
offset: ${offset},
state: ${state}
    ''';
  }
}
