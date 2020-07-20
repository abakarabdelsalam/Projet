import 'package:flutter/material.dart';

class VilleCard extends StatelessWidget {
  final String name;
  final String image;
  final bool cheched;

  VilleCard({this.name, this.image, this.cheched});
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
              image: AssetImage(image),
              child: InkWell(
                onTap: () {},
              ),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
