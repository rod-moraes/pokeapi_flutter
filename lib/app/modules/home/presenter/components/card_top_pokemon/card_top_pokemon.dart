import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapi_flutter/app/shared/utils/responsividade_utils.dart';

import 'dados_top_pokemon.dart';
import 'divider_top_pokemon.dart';

class CardTopPokemon extends StatelessWidget {
  const CardTopPokemon({super.key});

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
              const Flexible(child: DadosTopPokemon()),
              const SizedBox(width: 100, height: 32),
              Flex(
                direction: isTablet ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DividerTopPokemon(),
                  SizedBox(height: 24, width: 24),
                  FaIcon(FontAwesomeIcons.fire, size: 48, color: Colors.white),
                  SizedBox(height: 24, width: 24),
                  DividerTopPokemon(isRotate: true),
                ],
              ),
              const SizedBox(width: 100, height: 32),
              Flexible(
                  child: Center(
                child: Image.asset('assets/images/charizard.png', width: 520),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
