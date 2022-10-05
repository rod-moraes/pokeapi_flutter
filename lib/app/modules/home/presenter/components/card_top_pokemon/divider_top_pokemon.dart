import 'package:flutter/material.dart';

import '../../../../../shared/utils/responsividade_utils.dart';

class DividerTopPokemon extends StatelessWidget {
  final bool isRotate;
  const DividerTopPokemon({
    Key? key,
    this.isRotate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsividadeUtils.isTablet(context);
    return RotatedBox(
      quarterTurns: isRotate ? 2 : 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0x00FFFFFF),
            ],
            begin: FractionalOffset(1.0, 1.0),
            end: FractionalOffset(0.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        width: isTablet ? 180 : 1,
        height: isTablet ? 1 : 180,
      ),
    );
  }
}
