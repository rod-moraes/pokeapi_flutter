import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/usecase/get_favorites_pokemon.dart';
import 'package:pokeapi_flutter/app/modules/home/external/datasource/pokeapi_remote_datasource_impl.dart';
import 'package:pokeapi_flutter/app/modules/home/infra/repository/pokeapi_repository_impl.dart';
import 'package:pokeapi_flutter/app/modules/home/presenter/stores/pokemon_store.dart';

import '../core/network/network_connect.dart';
import 'modules/home/domain/repository/pokeapi_repository_contract.dart';
import 'modules/home/domain/usecase/get_list_pokemon.dart';
import 'modules/home/domain/usecase/get_pokemon.dart';
import 'modules/home/domain/usecase/get_random_pokemon.dart';
import 'modules/home/domain/usecase/remove_favorite_pokemon.dart';
import 'modules/home/domain/usecase/set_favorite_pokemon.dart';
import 'modules/home/external/datasource/pokeapi_local_datasource_impl.dart';
import 'modules/home/infra/datasource/pokeapi_local_datasource_contract.dart';
import 'modules/home/infra/datasource/pokeapi_remote_datasource_contract.dart';
import 'modules/home/presenter/pages/pokemon_page.dart';
import 'modules/home/presenter/stores/favorite_pokemon_store.dart';
import 'modules/home/presenter/stores/list_pokemon_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<PokeapiLocalDataSourceContract>(
            (i) => PokeapiLocalDataSourceImpl()),
        Bind.factory<InternetConnectionCheckerPlus>(
            (i) => InternetConnectionCheckerPlus()),
        Bind.factory<Random>((i) => Random()),
        Bind.factory<Client>((i) => Client()),

        //implementações
        Bind.factory((i) => NetworkConnectImpl(i())),
        Bind.factory<PokeapiRemoteDataSourceContract>(
            (i) => PokeapiRemoteDataSourceImpl(i())),
        Bind.factory<PokeapiRepositoryContract>((i) => PokeapiRepositoryImpl(
            networkConnect: i(),
            random: i(),
            remoteDataSource: i(),
            localDataSource: i())),
        Bind.factory<GetListPokemonContract>((i) => GetListPokemonImpl(i())),
        Bind.factory<GetRandomPokemonContract>(
            (i) => GetRandomPokemonImpl(i())),
        Bind.factory<GetPokemonContract>((i) => GetPokemonImpl(i())),

        Bind.factory<GetFavoritesPokemonContract>(
            (i) => GetFavoritesPokemonImpl(i())),
        Bind.factory<RemoveFavoritePokemonContract>(
            (i) => RemoveFavoritePokemonImpl(i())),
        Bind.factory<SetFavoritePokemonContract>(
            (i) => SetFavoritePokemonImpl(i())),

        Bind.lazySingleton((i) => FavoritePokemonStore(i(), i())),
        Bind.lazySingleton((i) => PokemonStore(i(), i())),
        Bind.lazySingleton((i) => ListPokemonStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            final offset = args.queryParams['offset'] ?? '';
            final id = args.queryParams['id'] ?? '';
            return PokemonPage(
                offset: int.tryParse(offset) ?? 0, id: int.tryParse(id));
          },
        ),
      ];
}
