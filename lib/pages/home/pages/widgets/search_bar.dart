import 'package:flutter/material.dart';

Widget searchBar(Function(String) onSearchQueryChanged) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Find your",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Pokémon",
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 243, 243, 1),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            onChanged: onSearchQueryChanged,
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                hintText: "Search here",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
