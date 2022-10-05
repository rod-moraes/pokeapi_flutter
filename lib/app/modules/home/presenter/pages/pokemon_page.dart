import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/app/modules/home/presenter/components/canvas_waves.dart';

import '../../../../shared/components/app_bar_pokemon.dart';
import '../../../../shared/utils/responsividade_utils.dart';
import '../components/card_top_pokemon/card_top_pokemon.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
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
                  const Center(child: CardTopPokemon()),
                  WavesCustomPainter.waves(context),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Expanded(
            child: Container(color: Colors.white),
          )),
          // const SliverToBoxAdapter(child: Center(child: CardTopPokemon())),
        ],
      ),
    );
  }
}
