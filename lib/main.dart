import 'package:flutter/material.dart';

import 'views/ville/ville.dart';

void main() => runApp(PlansVoyage());

class PlansVoyage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Ville());
  }
}
