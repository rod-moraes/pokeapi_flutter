import 'package:flutter/material.dart';

enum TypePokemonEnum {
  bug('Bug', Color(0xff7BCF00), 'assets/images/bug.png'),
  dark('Dark', Color(0xff5A566A), 'assets/images/dark.png'),
  dragon('Dragon', Color(0xff0076FF), 'assets/images/dragon.png'),
  electric('Electric', Color(0xffFFDE00), 'assets/images/electric.png'),
  fairy('Fairy', Color(0xffe5c7d6), 'assets/images/fairy.png'),
  fighting('Fighting', Color(0xff2f0909), 'assets/images/fighting.png'),
  fire('Fire', Color(0xffFF9900), 'assets/images/fire.png'),
  flying('Flying', Color(0xff89BDFF), 'assets/images/flying.png'),
  ghost('Ghost', Color.fromARGB(255, 129, 138, 129), 'assets/images/ghost.png'),
  ground('Ground', Color.fromARGB(255, 83, 46, 46), 'assets/images/ground.png'),
  grass('Grass', Color(0xff1CD80E), 'assets/images/grass.png'),
  ice('Ice', Color.fromARGB(255, 1, 89, 139), 'assets/images/ice.png'),
  normal('Normal', Color.fromARGB(255, 88, 68, 68), 'assets/images/normal.png'),
  poison('Poison', Color(0xffF149FF), 'assets/images/poison.png'),
  psychic('Psychic', Color(0xff5A566A), 'assets/images/psychic.png'),
  rock('Rock', Color.fromARGB(255, 88, 68, 68), 'assets/images/rock.png'),
  steel('Steel', Color.fromARGB(255, 129, 138, 129), 'assets/images/steel.png'),
  water('Water', Color(0xff14A8FF), 'assets/images/water.png');

  final String name;
  final Color color;
  final String path;
  const TypePokemonEnum(this.name, this.color, this.path);
}
