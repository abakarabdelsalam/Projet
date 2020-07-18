import 'package:flutter/material.dart';

void main() => runApp(PlansVoyage());

class PlansVoyage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('Mes Plans de Voyage'),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
          child: Text('Cc Bonjours '),
        ),
      ),
    );
  }
}
