import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  List<Pokemon> pokemonList = [];
  int offset = 0; // Offset para la paginación

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=30&offset=$offset'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'];

      setState(() {
        pokemonList = results.map<Pokemon>((result) => Pokemon.fromJson(result)).toList();
      });

      // Obtener información detallada de cada Pokémon y actualizar la lista
      for (var pokemon in pokemonList) {
        final detailsResponse = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemon.id}/'));
        if (detailsResponse.statusCode == 200) {
          final detailsData = json.decode(detailsResponse.body);
          pokemon.spriteUrl = detailsData['sprites']['front_default'];
        }
      }

      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> loadNextPage() async {
    offset += 30;
    await fetchData();
  }

  Future<void> loadPreviousPage() async {
    if (offset >= 30) {
      offset -= 30;
      await fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido a nuestro catálogo de Pokémon',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildColumn(0),
                      _buildColumn(10),
                      _buildColumn(20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: loadPreviousPage,
                      child: Text('Anterior'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: loadNextPage,
                      child: Text('Siguiente'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(int startIndex) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[startIndex + index];
          return ListTile(
            title: Text(pokemon.name),
            subtitle: Text('Pokédex #: ${pokemon.id}'),
            leading: pokemon.spriteUrl != null
                ? Image.network(pokemon.spriteUrl!)
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Pokemon {
  final String name;
  final int id;
  String? spriteUrl;

  Pokemon({required this.name, required this.id, this.spriteUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: int.parse(json['url'].split('/').reversed.skip(1).first),
    );
  }
}
