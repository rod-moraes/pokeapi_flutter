import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokeapi_flutter/app/modules/home/domain/entities/type_pokemon.dart';

import '../../../../../shared/utils/responsividade_utils.dart';
import '../../../domain/entities/pokemon.dart';
import '../type_pokemon_tag_widget.dart';
import 'button_top_pokemon.dart';

class DadosTopPokemon extends StatelessWidget {
  final Pokemon pokemon;
  const DadosTopPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

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
        Text(
          '#${pokemon.id.toString().padLeft(4, '0')}',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 32 / 24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          direction: Axis.horizontal,
          children: [
            ...pokemon.types
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TypePokemonTagWidget(
                      typePokemon: TypePokemonEnum.values.byName(e),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          pokemon.name.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 56,
            height: 86 / 56,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Flexible(
              child: Text(
                style: const TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.white,
                ),
                softWrap: true,
                pokemon.description,
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
