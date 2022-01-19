import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBox extends StatefulWidget {
  Color? color;
  String? title;
  String? route;
  CardBox({Key? key, this.color, this.title, this.route}) : super(key: key);

  @override
  CardBoxState createState() => CardBoxState();
}

class CardBoxState extends State<CardBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Ink(
        decoration: BoxDecoration(
          color: widget.color?.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          splashColor: widget.color,
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            if (widget.route != null) {
              Navigator.of(context).pushNamed(
                "/pokedex",
              );
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment(2, 0),
                opacity: 0.3,
                image: AssetImage("assets/image/pokeball.png"),
              ),
            ),
            alignment: Alignment.centerLeft,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                (widget.title != null) ? widget.title.toString() : "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
