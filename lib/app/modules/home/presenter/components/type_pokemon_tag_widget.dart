import 'package:flutter/material.dart';

import '../../domain/entities/type_pokemon.dart';

class TypePokemonTagWidget extends StatelessWidget {
  final TypePokemonEnum typePokemon;
  const TypePokemonTagWidget({
    Key? key,
    required this.typePokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: typePokemon.color,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(typePokemon.path, width: 16, height: 16),
          const SizedBox(width: 10),
          Text(
            typePokemon.name,
            style: const TextStyle(
                fontSize: 16, height: 24 / 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
