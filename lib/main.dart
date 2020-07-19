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
          padding: EdgeInsets.all(7),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10,
                child: Container(
                  height: 170,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('assets/images/Toulouse.jpg',
                          fit: BoxFit.cover)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
