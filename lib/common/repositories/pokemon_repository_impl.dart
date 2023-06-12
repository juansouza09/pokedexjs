import 'dart:convert';

import 'package:pokedex_flutter/common/consts/api_consts.dart';

import '../models/pokemon.dart';
import 'package:http/http.dart' as http;

import 'pokemon_repository.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      http.Response response =
          await http.get(Uri.parse(ApiConsts.allPokemonsURL));
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw "Não foi receber os dados! Tente novamente!";
    }
  }
}
