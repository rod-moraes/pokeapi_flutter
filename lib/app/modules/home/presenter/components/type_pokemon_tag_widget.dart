import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TypePokemonTagWidget extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;
  const TypePokemonTagWidget({
    Key? key,
    required this.name,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
                fontSize: 16, height: 24 / 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
