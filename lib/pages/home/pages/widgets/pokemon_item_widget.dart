import 'package:flutter/material.dart';

import '../../../../common/models/pokemon.dart';
import '../../../details/container/detail_container.dart';
import 'type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        '/details',
        DetailArguments(pokemon: pokemon, index: index),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => TypeWidget(
                                  name: e,
                                ))
                            .toList(),
                      ),
                      const Flexible(
                          child: SizedBox(
                        height: 100,
                        width: 100,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Image.network(
              pokemon.image,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
