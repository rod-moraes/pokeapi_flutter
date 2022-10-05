import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../shared/utils/responsividade_utils.dart';
import '../type_pokemon_tag_widget.dart';
import 'button_top_pokemon.dart';

class DadosTopPokemon extends StatelessWidget {
  const DadosTopPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsividadeUtils.isTablet(context);
    final isMobile = ResponsividadeUtils.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.start
          : (isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start),
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "#006",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 32 / 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            TypePokemonTagWidget(
              color: Color(0xffFF9900),
              icon: FontAwesomeIcons.fire,
              name: "Fire",
            ),
            SizedBox(width: 8),
            TypePokemonTagWidget(
              color: Color(0xff89BDFF),
              icon: FontAwesomeIcons.fly,
              name: "Flying",
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "CHARIZARD",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 64,
            height: 86 / 64,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Flexible(
              child: Text(
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.white,
                ),
                softWrap: true,
                'Charizard se assemelha a um grande tradicional dragão europeu. Apesar da semelhança, Charizard é explicitamente um Pokémon dos tipos Fogo e Voador, e não um tipo Dragão, exceto em sua forma "Mega Charizard X"; No entanto, ele pode aprender ataques do tipo Dragão.',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ButtonTopPokemon(
          icon: FontAwesomeIcons.thunderstorm,
          onTap: () {},
          label: "Mais Detalhes",
        ),
      ],
    );
  }
}
