import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/type_pokemon_tag_widget.dart';

class ListPokemonPage extends StatefulWidget {
  const ListPokemonPage({super.key});

  @override
  State<ListPokemonPage> createState() => _ListPokemonPageState();
}

class _ListPokemonPageState extends State<ListPokemonPage> {
  @override
  Widget build(BuildContext context) {
    const desiredWidth = 1080.0;
    final isTablet = MediaQuery.of(context).size.width < desiredWidth;
    final isMobile = MediaQuery.of(context).size.width < 620;
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  width: desiredWidth,
                  height: 56,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 153,
                        height: 56,
                        child: Image.asset(
                          'assets/images/logo-pokemon.png',
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              padding: const EdgeInsets.all(12),
                              child: const FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onTap: () {
                              print("Pressed");
                            },
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              padding: const EdgeInsets.all(12),
                              child: const FaIcon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onTap: () {
                              print("Pressed");
                            },
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              padding: const EdgeInsets.all(12),
                              child: const FaIcon(
                                FontAwesomeIcons.telegram,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            onTap: () {
                              print("Pressed");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  width: isTablet ? 600 : desiredWidth,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    children: [
                      Flex(
                        direction: isTablet ? Axis.vertical : Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: isMobile
                                  ? CrossAxisAlignment.start
                                  : (isTablet
                                      ? CrossAxisAlignment.center
                                      : CrossAxisAlignment.start),
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
                                InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {},
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        FaIcon(
                                          FontAwesomeIcons.thunderstorm,
                                          size: 16,
                                          color: Color(0xffE14318),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Mais Detalhes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            height: 24 / 16,
                                            color: Color(0xffE14318),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                              child: Center(
                            child: Image.asset(
                              'assets/images/charizard.png',
                              width: 520,
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
