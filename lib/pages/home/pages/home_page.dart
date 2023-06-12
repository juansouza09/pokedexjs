import 'package:flutter/material.dart';

import '../../../common/models/pokemon.dart';
import '../../details/container/detail_container.dart';
import 'widgets/pokemon_item_widget.dart';
import 'widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  List<Pokemon> searchResults = [];

  void onSearchQueryChanged(String query) {
    setState(() {
      searchQuery = query;
      searchResults = performSearch(query);
    });
  }

  List<Pokemon> performSearch(String query) {
    return widget.list.where((pokemon) {
      final name = pokemon.name.toLowerCase();
      final type = pokemon.type;
      final queryLower = query.toLowerCase();
      return name.contains(queryLower) || type.contains(queryLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = searchQuery.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Pokedex JS',
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
        ),
      ),
      body: Column(
        children: [
          searchBar(onSearchQueryChanged),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: isSearching
                    ? searchResults
                        .map(
                          (pokemon) => PokemonItemWidget(
                            pokemon: pokemon,
                            index: widget.list.indexOf(pokemon),
                            onTap: widget.onItemTap,
                          ),
                        )
                        .toList()
                    : widget.list
                        .map(
                          (pokemon) => PokemonItemWidget(
                            pokemon: pokemon,
                            index: widget.list.indexOf(pokemon),
                            onTap: widget.onItemTap,
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
