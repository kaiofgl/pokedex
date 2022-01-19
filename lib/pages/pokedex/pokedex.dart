import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokedex/http/requestApi.dart';
import 'package:pokedex/components/pokemon-colors.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  double allPadding = 20;
  ApiPokedex pokemon = ApiPokedex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.analytics),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.clear_all,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(allPadding),
              child: const Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(allPadding),
              child: FutureBuilder(
                future: pokemon.getPokemonsData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var pokemonListReturn = snapshot.data as List;
                    // var actualColor = pokemonColors.keys.firstWhere((k) => pokemonColors[k] == );
                    print(pokemonColors);
                    return GridView.builder(
                        itemCount: pokemonListReturn.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.4,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          var actualPokemonCard =
                              json.decode(pokemonListReturn[index].body);
                          var countEgg = actualPokemonCard['types'];
                          return Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.blue),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: allPadding,
                                  right: allPadding,
                                  top: allPadding + (allPadding / 4),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      actualPokemonCard['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    for (var i in countEgg)
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              i['type']['name'].toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     color: Colors.blue),
//                                 child:
//                                 ));