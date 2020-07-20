import 'package:flutter/material.dart';

import 'ville_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            VilleCard(image: 'assets/images/Toulouse.jpg', name: 'Toulouse'),
          ],
        ),
      ),
    );
  }
}
