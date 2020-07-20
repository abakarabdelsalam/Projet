import 'package:flutter/material.dart';

import 'ville_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List villes = [
    {
      'name': 'Toulouse',
      'image': 'assets/images/Toulouse.jpg',
    },
    {
      'name': 'paris',
      'image': 'assets/images/paris.jpg',
    },
    {
      'Nantes': 'paris',
      'image': 'assets/images/nantes.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    villes.map((ville) => print(ville));

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Colors.greenAccent,
        title: Text('Mes Plans de Voyage'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: villes
              .map((ville) =>
                  VilleCard(name: ville['name'], image: ville['image']))
              .toList(),
        ),
      ),
    );
  }
}
