import '../../models/ville_model.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:PlningVyage/views/ville/ville_view.dart';

class VilleCard extends StatelessWidget {
  final Ville ville;
  VilleCard({this.ville});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Container(
          height: 170,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                image: AssetImage(ville.image),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Villeview();
                        },
                      ),
                    );
                  },
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  ville.name,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      backgroundColor: Colors.black54),
                ),
              )
            ],
          ),
        ));
  }
}
