import 'package:flutter/material.dart';

import '../../../../../shared/utils/responsividade_utils.dart';
import '../../../domain/entities/pokemon.dart';
import 'tile_pokemon.dart';

class ListPokemon extends StatelessWidget {
  final List<Pokemon> pokemons;
  const ListPokemon({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desiredWidth = ResponsividadeUtils.desiredWidth;
    final isTablet = ResponsividadeUtils.isTablet(context);
    return Container(
      width: isTablet ? 600 : desiredWidth,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 384,
            mainAxisExtent: 468,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext ctx, index) {
            return TilePokemon(pokemon: pokemons[index]);
          }),
    );
  }
}
