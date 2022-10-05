import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonTopPokemon extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final void Function()? onTap;
  const ButtonTopPokemon({
    Key? key,
    required this.label,
    required this.icon,
    this.backgroundColor = const Color(0xffffffff),
    this.color = const Color(0xffE14318),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 16, color: color),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 16, height: 24 / 16, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
