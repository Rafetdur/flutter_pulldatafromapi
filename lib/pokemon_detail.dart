import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apppokedex/pokedex.dart';

// M  : model : api den veriyi çekme kısmı
// V:  view : arayüz kısmı
// C: controller:   api ve arayüz haberleşmesi

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return dikeyBody(context);
        } else {
          return yatayBody(context);
        }
      }),
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  width: 200,
                  child: Image.network(pokemon.img, fit: BoxFit.fill),
                )),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height: " + pokemon.height,
                  ),
                  Text(
                    "Weight:  " + pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: CupertinoColors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("İlk hali")],
                  ),
                  Text(
                    "New Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("Son hali")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weakness) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  weakness,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("Zayıflığı yok")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height: " + pokemon.height,
                  ),
                  Text(
                    "Weight:  " + pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: CupertinoColors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("İlk hali")],
                  ),
                  Text(
                    "New Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("Son hali")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weakness) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  weakness,
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                )))
                            .toList()
                        : [Text("Zayıflığı yok")],
                  ),
                ],
              )),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(pokemon.img, fit: BoxFit.contain),
              )),
        )
      ],
    );
  }
}
