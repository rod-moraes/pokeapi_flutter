import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pokeapi_flutter/app/modules/home/presenter/components/canvas_waves.dart';
import 'package:pokeapi_flutter/app/modules/home/presenter/components/list_pokemon/list_pokemon.dart';
import 'package:pokeapi_flutter/app/modules/home/presenter/states/list_pokemon_state.dart';
import 'package:pokeapi_flutter/app/modules/home/presenter/stores/list_pokemon_store.dart';

import '../../../../shared/components/app_bar_pokemon.dart';
import '../../../../shared/components/icon_button_widget.dart';
import '../../../../shared/utils/responsividade_utils.dart';
import '../components/card_top_pokemon/card_top_pokemon.dart';
import '../states/pokemon_state.dart' as pokemonState;
import '../stores/pokemon_store.dart';

class PokemonPage extends StatefulWidget {
  final int offset;
  final int? id;
  final bool favorite;
  const PokemonPage({Key? key, this.offset = 0, this.id, this.favorite = false})
      : super(key: key);
  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final storeList = Modular.get<ListPokemonStore>();
  final storePokemon = Modular.get<PokemonStore>();

  @override
  void initState() {
    storeList.isFavorite = widget.favorite;
    print(widget.favorite);
    storeList.setOffset(widget.offset);
    storePokemon.setIdPokemon(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final desiredWidth = ResponsividadeUtils.desiredWidth;
    final isTablet = ResponsividadeUtils.isTablet(context);
    return Scaffold(
      backgroundColor: const Color(0xff060B28),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEE8328),
                    Color(0xFFE14318),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                children: [
                  const AppBarPokemon(),
                  Observer(
                    builder: (context) {
                      final state = storePokemon.state;
                      if (state is pokemonState.LoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is pokemonState.SuccessState) {
                        return Center(
                            child: CardTopPokemon(pokemon: state.pokemon));
                      } else if (state is pokemonState.ErrorState) {
                        return Text(state.error.message);
                      }
                      return Container();
                    },
                  ),
                  WavesCustomPainter.waves(context),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: isTablet ? 600 : desiredWidth,
                child: Row(
                  children: [
                    IconButtonWidget(
                        icon: FontAwesomeIcons.house,
                        onTap: () {
                          storeList.offset = 0;
                          storeList.setFavorite(false);
                        }),
                    IconButtonWidget(
                        icon: FontAwesomeIcons.solidStar,
                        onTap: () {
                          storeList.offset = 0;
                          storeList.setFavorite(true);
                        }),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Observer(
              builder: (context) {
                final state = storeList.state;
                if (state is LoadingState) {
                  return Container(
                    height: 550,
                    padding: const EdgeInsets.all(16.0),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is SuccessState) {
                  if (state.list.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          Image.asset('assets/images/pikachu.png'),
                          const Text(
                            'Ops! Essa pagina está vazia!',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              height: 32 / 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    );
                  }
                  return Center(child: ListPokemon(pokemons: state.list));
                } else if (state is ErrorState) {
                  return Text(state.error.message);
                }
                return Container();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButtonWidget(
                        icon: Icons.arrow_back,
                        onTap: () {
                          storeList.setOffset(storeList.offset - 6);
                        }),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Text(
                        ((storeList.offset / 6) + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButtonWidget(
                        icon: Icons.arrow_forward,
                        onTap: () {
                          storeList.setOffset(storeList.offset + 6);
                        }),
                  ],
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
