import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/presenter/pages/pokemon_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PokemonPage()),
      ];
}
