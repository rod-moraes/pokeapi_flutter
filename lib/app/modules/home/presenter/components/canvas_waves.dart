import 'dart:math';

import 'package:flutter/material.dart';

class WavesCustomPainter {
  static Widget waves(BuildContext context) => Stack(
        alignment: const Alignment(0.0, 1.2),
        children: [
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width,
                max(
                    min(
                        (MediaQuery.of(context).size.width * 0.047396)
                            .toDouble(),
                        150.0 * 0.47396),
                    60 * 0.47396)),
            painter: WavesFirst(),
          ),
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width,
                max(
                    min(
                        (MediaQuery.of(context).size.width * 0.057292)
                            .toDouble(),
                        150.0 * 0.57292),
                    60 * 0.57292)),
            painter: WavesSecond(),
          ),
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width,
                max(
                    min(
                        (MediaQuery.of(context).size.width * 0.04739)
                            .toDouble(),
                        150.0 * 0.4739),
                    60 * 0.4739)),
            painter: WavesThree(),
          ),
        ],
      );
}

class WavesFirst extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, size.height * 0.9381319);
    path_0.cubicTo(
        size.width * 0.1249417,
        size.height * 0.3516484,
        size.width * 0.2617417,
        size.height * 0.2162637,
        size.width * 0.3965250,
        size.height * 0.5321978);
    path_0.cubicTo(
        size.width * 0.5520313,
        size.height * 0.9178022,
        size.width * 0.5965990,
        size.height * 0.6884615,
        size.width * 0.6408333,
        size.height * 0.4339560);
    path_0.cubicTo(
        size.width * 0.6899427,
        size.height * 0.1514286,
        size.width * 0.7383333,
        size.height * -0.04659352,
        size.width * 0.7926667,
        size.height * 0.01098892);
    path_0.cubicTo(
        size.width * 0.8647760,
        size.height * 0.08791198,
        size.width * 0.9363854,
        size.height * 0.5132967,
        size.width,
        size.height * 0.9429670);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff060B28);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesSecond extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, size.height * 0.8562727);
    path_0.cubicTo(
        size.width * 0.01083333,
        size.height * 0.6643636,
        size.width * 0.02303333,
        size.height * 0.4830909,
        size.width * 0.03974167,
        size.height * 0.3450000);
    path_0.cubicTo(
        size.width * 0.08284167,
        size.height * -0.01154545,
        size.width * 0.1375000,
        size.height * -0.009090836,
        size.width * 0.1871500,
        size.height * 0.1674545);
    path_0.cubicTo(
        size.width * 0.2131083,
        size.height * 0.2597273,
        size.width * 0.2372250,
        size.height * 0.4044545,
        size.width * 0.2618750,
        size.height * 0.5292727);
    path_0.cubicTo(
        size.width * 0.2959750,
        size.height * 0.7020000,
        size.width * 0.3324833,
        size.height * 0.9474545,
        size.width * 0.3709000,
        size.height * 0.9808182);
    path_0.cubicTo(
        size.width * 0.4011167,
        size.height * 1.006727,
        size.width * 0.4299833,
        size.height * 0.8951818,
        size.width * 0.4530667,
        size.height * 0.6939091);
    path_0.cubicTo(
        size.width * 0.4795417,
        size.height * 0.4630909,
        size.width * 0.5050000,
        size.height * 0.1302727,
        size.width * 0.5394271,
        size.height * 0.03027282);
    path_0.cubicTo(
        size.width * 0.5731250,
        size.height * -0.06781809,
        size.width * 0.6072187,
        size.height * 0.09109091,
        size.width * 0.6386979,
        size.height * 0.2510000);
    path_0.cubicTo(
        size.width * 0.6701823,
        size.height * 0.4109091,
        size.width * 0.7013333,
        size.height * 0.6055455,
        size.width * 0.7361354,
        size.height * 0.6423636);
    path_0.cubicTo(
        size.width * 0.7859063,
        size.height * 0.6955455,
        size.width * 0.8305312,
        size.height * 0.4343636,
        size.width * 0.8768854,
        size.height * 0.2892727);
    path_0.cubicTo(
        size.width * 0.9020521,
        size.height * 0.2105455,
        size.width * 0.9260521,
        size.height * 0.2331818,
        size.width * 0.9494583,
        size.height * 0.3574545);
    path_0.cubicTo(
        size.width * 0.9681510,
        size.height * 0.4564545,
        size.width * 0.9894583,
        size.height * 0.6022727,
        size.width,
        size.height * 0.8050909);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0x59060B28);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class WavesThree extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, size.height * 0.4913187);
    path_0.cubicTo(
        size.width * 0.03982500,
        size.height * 0.2473626,
        size.width * 0.08632500,
        size.height * 0.1378022,
        size.width * 0.1316667,
        size.height * 0.1836264);
    path_0.cubicTo(
        size.width * 0.1903000,
        size.height * 0.2426374,
        size.width * 0.2452750,
        size.height * 0.5496703,
        size.width * 0.3040000,
        size.height * 0.5957143);
    path_0.cubicTo(
        size.width * 0.3655333,
        size.height * 0.6436264,
        size.width * 0.4269500,
        size.height * 0.4102198,
        size.width * 0.4858333,
        size.height * 0.2082418);
    path_0.cubicTo(
        size.width * 0.5435573,
        size.height * 0.01043962,
        size.width * 0.6010833,
        size.height * -0.06516473,
        size.width * 0.6603333,
        size.height * 0.06450560);
    path_0.cubicTo(
        size.width * 0.6904583,
        size.height * 0.1304396,
        size.width * 0.7185417,
        size.height * 0.2605495,
        size.width * 0.7473750,
        size.height * 0.3869231);
    path_0.cubicTo(
        size.width * 0.8245729,
        size.height * 0.7252747,
        size.width * 0.9275000,
        size.height * 1.157033,
        size.width,
        size.height * 0.4234066);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0x19060B28);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
