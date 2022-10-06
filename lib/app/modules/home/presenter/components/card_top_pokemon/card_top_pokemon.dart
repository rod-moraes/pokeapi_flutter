import 'package:flutter/material.dart';

import 'package:pokeapi_flutter/app/shared/utils/responsividade_utils.dart';

import '../../../domain/entities/pokemon.dart';
import '../../../domain/entities/type_pokemon.dart';
import 'dados_top_pokemon.dart';
import 'divider_top_pokemon.dart';

class CardTopPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const CardTopPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final desiredWidth = ResponsividadeUtils.desiredWidth;
    final isTablet = ResponsividadeUtils.isTablet(context);
    return Container(
      width: isTablet ? 600 : desiredWidth,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Flex(
            direction: isTablet ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: DadosTopPokemon(pokemon: pokemon)),
              const SizedBox(width: 100, height: 32),
              Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Flex(
                    direction: isTablet ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const DividerTopPokemon(),
                      const SizedBox(height: 24, width: 24),
                      Image.asset(
                        TypePokemonEnum.values.byName(pokemon.types.first).path,
                        height: 48,
                        width: 48,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(height: 24, width: 24),
                      const DividerTopPokemon(isRotate: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 100, height: 32),
              Flexible(
                  child: Center(
                child: Image.network(pokemon.spriteDreamUrl, width: 520),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
