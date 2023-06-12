import 'package:flutter/material.dart';

import '../../../../common/models/pokemon.dart';

class DetailPokemon extends StatelessWidget {
  const DetailPokemon({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Height: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(pokemon.height.toString())
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  "Weight: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(pokemon.weight.toString())
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  "Candy: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(pokemon.candy.toString())
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  "Egg: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(pokemon.egg.toString())
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Text(
                  "Spawn time: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(pokemon.spawnTime.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
