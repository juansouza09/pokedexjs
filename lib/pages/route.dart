import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository_impl.dart';

import 'details/container/detail_container.dart';
import 'home/container/home_container.dart';
import 'splash_page.dart';

class PokedexRoute extends StatefulWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  final PokemonRepositoryImpl repository;

  @override
  _PokedexRouteState createState() => _PokedexRouteState();
}

class _PokedexRouteState extends State<PokedexRoute> {
  bool _showSplashScreen = true;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return _showSplashScreen
                  ? const SplashScreen()
                  : HomeContainer(
                      repository: widget.repository,
                      onItemTap: (route, arguments) {
                        Navigator.of(context)
                            .pushNamed(route, arguments: arguments);
                      },
                    );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: widget.repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }

        return null;
      },
    );
  }
}
