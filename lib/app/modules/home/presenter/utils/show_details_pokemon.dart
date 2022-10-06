import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';
import 'package:pokeapi_flutter/app/shared/utils/responsividade_utils.dart';

import '../../../../shared/components/icon_button_widget.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/type_pokemon.dart';
import '../components/type_pokemon_tag_widget.dart';

class ShowDatailsPokemon {
  static showDetailsPokemon(Pokemon pokemon) {
    WidgetSpan _progressBar(double value) {
      return WidgetSpan(
        child: Container(
          width: 170,
          height: 20,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.only(left: 12),
          child: LinearProgressIndicator(
            minHeight: 100,
            value: value / 100,
            backgroundColor: Colors.grey,
            color: Colors.green,
          ),
        ),
      );
    }

    Asuka.showDialog(
      barrierColor: const Color(0x7f000000),
      builder: (context) {
        const style = TextStyle(
          color: Colors.white,
          fontSize: 16,
        );
        final isTablet = ResponsividadeUtils.isTablet(context);
        final isMobile = ResponsividadeUtils.isMobile(context);
        return Center(
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: isMobile
                  ? 343
                  : isTablet
                      ? 568
                      : 948,
              height: isMobile
                  ? 734
                  : isTablet
                      ? 734
                      : 352,
              child: Stack(
                children: [
                  Flex(
                    direction: isTablet ? Axis.vertical : Axis.horizontal,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              pokemon.spriteDreamUrl,
                              height: 212,
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.high,
                            ),
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
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: TypePokemonTagWidget(
                                          typePokemon:
                                              TypePokemonEnum.values.byName(e),
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
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 24),
                                  Text(
                                    "Stats",
                                    style: style.copyWith(fontSize: 32),
                                  ),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      textAlign: TextAlign.justify,
                                      TextSpan(text: "HP: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[0]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[0]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      TextSpan(text: "Attack: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[1]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[1]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      TextSpan(text: "Defense: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[2]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[2]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      TextSpan(text: "Sp.Atk: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[3]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[3]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      TextSpan(text: "Sp.Def: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[4]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[4]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                  const SizedBox(height: 24),
                                  Text.rich(
                                      style: style,
                                      TextSpan(text: "Speed: ", children: [
                                        TextSpan(
                                            text: pokemon.stats[5]['base_stat']
                                                    ?.toString() ??
                                                '0'),
                                        _progressBar(double.parse(pokemon
                                                .stats[5]['base_stat']
                                                ?.toString() ??
                                            '0')),
                                      ])),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  Align(
                    alignment: const Alignment(0.975, -0.95),
                    child: IconButtonWidget(
                      icon: FontAwesomeIcons.close,
                      onTap: () {
                        Navigator.maybePop(context);
                      },
                    ),
                  ),
                ],
              ),
            ).asGlass(
              blurX: 20,
              blurY: 20,
              clipBorderRadius: BorderRadius.circular(24),
              tintColor: const Color.fromRGBO(6, 11, 40, 0.15),
            ),
          ),
        );
      },
    );
  }
}
