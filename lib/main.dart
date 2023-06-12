import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_flutter/pages/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PokedexRoute(repository: PokemonRepositoryImpl()),
    );
  }
}
