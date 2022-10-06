import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const IconButtonWidget({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(12),
          child: FaIcon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
