import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pokedex/pages/index/index.dart';
import 'package:pokedex/pages/pokedex/pokedex.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Publica Sans'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => IndexPage(),
        "/pokedex": (BuildContext context) => PokedexPage(),
      },
    );
  }
}
