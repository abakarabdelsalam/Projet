import '../../models/ville_model.dart';
import 'package:PlningVyage/views/widgets/ville_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Ville> villes = [
    Ville(name: 'Toulouse', image: 'assets/images/Toulouse.jpg'),
    Ville(name: 'Paris', image: 'assets/images/paris.jpg'),
    Ville(name: 'Nantes', image: 'assets/images/nantes.jpg'),
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
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: villes.map((ville) => VilleCard(ville: ville)).toList(),
        ),
      ),
    );
  }
}
