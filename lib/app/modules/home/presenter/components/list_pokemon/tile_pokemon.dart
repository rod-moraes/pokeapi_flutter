import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../../domain/entities/pokemon.dart';
import '../../../domain/entities/type_pokemon.dart';
import '../card_top_pokemon/button_top_pokemon.dart';
import '../type_pokemon_tag_widget.dart';

class TilePokemon extends StatelessWidget {
  final Pokemon pokemon;
  const TilePokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final type = TypePokemonEnum.values.byName(pokemon.types.first);
    return Container(
      alignment: Alignment.center,
      width: 384,
      height: 468,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  type.color.withOpacity(0.5),
                  Colors.transparent,
                ], radius: 1),
                borderRadius: BorderRadius.circular(24),
              ),
              width: 384,
              height: 300,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '#${pokemon.id.toString().padLeft(4, '0')}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 27 / 20,
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
                      toBeginningOfSentenceCase(pokemon.name) ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        height: 43 / 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ButtonTopPokemon(
                      icon: Icons.thunderstorm,
                      label: "Mais Detalhes",
                      backgroundColor: type.color,
                      color: Colors.white,
                      onTap: () {},
                    ),
                  ],
                ),
              ).asGlass(
                clipBorderRadius: BorderRadius.circular(24),
                blurX: 5,
                blurY: 5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              pokemon.spriteDreamUrl,
              width: 256,
              height: 256,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
