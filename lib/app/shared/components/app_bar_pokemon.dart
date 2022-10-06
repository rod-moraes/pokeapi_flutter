import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/responsividade_utils.dart';
import 'icon_button_widget.dart';

class AppBarPokemon extends StatelessWidget {
  const AppBarPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final desiredWidth = ResponsividadeUtils.desiredWidth;
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: desiredWidth, minWidth: 330),
        height: 56,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: LayoutBuilder(builder: (context, constrains) {
          return FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: max(330, constrains.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 153,
                    height: 56,
                    child: Image.asset('assets/images/logo-pokemon.png'),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButtonWidget(
                          icon: FontAwesomeIcons.linkedin,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        IconButtonWidget(
                          icon: FontAwesomeIcons.github,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        IconButtonWidget(
                          icon: FontAwesomeIcons.telegram,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
