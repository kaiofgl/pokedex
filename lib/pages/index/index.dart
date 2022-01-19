import 'package:flutter/material.dart';
import 'package:pokedex/components/cards/card.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopBarComponent(),
      backgroundColor: Colors.white,
    );
  }
}

class TopBarComponent extends StatefulWidget {
  const TopBarComponent({Key? key}) : super(key: key);

  @override
  _TopBarComponentState createState() => _TopBarComponentState();
}

class _TopBarComponentState extends State<TopBarComponent> {
  double allPadding = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),

      alignment: Alignment.center,
      // height: 550,
      child: Padding(
        padding: EdgeInsets.all(allPadding),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                "Qual Pokemon você gostaria de achar?",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25.0),
              child: TextField(
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  hintText: "Digite um Pokemon, Habilidade etc...",
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CardBox(
                      title: "Pokedex",
                      color: Colors.red,
                      route: "/pokedex",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CardBox(
                      title: "Movimentos",
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CardBox(
                      title: "Habilidades",
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CardBox(
                      title: "Itens",
                      color: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CardBox(
                      title: "Locations",
                      color: Colors.pink,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CardBox(
                      title: "Tipos",
                      color: Colors.teal,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
