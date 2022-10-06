import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../shared/components/icon_button_widget.dart';
import '../../../domain/entities/pokemon.dart';

class FavoriteIconButton extends StatefulWidget {
  final Pokemon pokemon;
  const FavoriteIconButton({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.pokemon.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      icon: !isFavorite ? FontAwesomeIcons.star : FontAwesomeIcons.solidStar,
      onTap: () {
        isFavorite = !isFavorite;
        setState(() {});
      },
    );
  }
}
