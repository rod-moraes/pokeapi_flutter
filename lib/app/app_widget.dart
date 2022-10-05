import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final Future<void> _future;
  var route = Modular.routerDelegate;
  Future<void> _frameFuture() async {
    Modular.setObservers([Asuka.asukaHeroController]);
    await Modular.isModuleReady<AppModule>();
    Modular.to.addListener(() {
      print(Modular.to.path);
    });
  }

  @override
  void initState() {
    _future = _frameFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            builder: Asuka.builder,
            title: 'PokeAPP',
            debugShowCheckedModeBanner: false,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
