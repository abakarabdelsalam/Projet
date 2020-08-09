import '../../models/ville_model.dart';
import 'package:flutter/material.dart';

class VilleCard extends StatelessWidget {
  final Ville ville;
  VilleCard({this.ville});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                image: AssetImage(ville.image),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/ville',
                      arguments: ville,
                    );
                  },
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: Colors.black54,
                  child: Text(
                    ville.name,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
