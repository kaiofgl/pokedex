import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiPokedex {
  getPokemonsData({String? nextPage}) async {
    if (nextPage != null) {
      String url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20";
    } else {
      String? url = nextPage;
    }

    http.Response response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"));

    return getPokemonsSpecificData(response.body);
  }

  getPokemonsSpecificData(dynamic response) async {
    var decoded = json.decode(response);
    List<http.Response> returnPokemonsData = [];
    for (int i = 0; i < decoded['results'].length; i++) {
      http.Response getUrlOfActualPokemon =
          await http.get(Uri.parse(decoded['results'][i]['url']));

      // var decodeJson = json.decode(getUrlOfActualPokemon.body);
      print(getUrlOfActualPokemon.body);

      // http.Response getSpeciePokemonData =
      //     await http.get(Uri.parse(decodeJson['species']['url']));
      returnPokemonsData.add(getUrlOfActualPokemon);
      // returnPokemonsData[decoded['results'][i]['name']] = "fsa";
    }
    return returnPokemonsData;
  }
}
