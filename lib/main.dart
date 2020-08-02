import 'package:PlningVyage/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(PlansVoyage());

class PlansVoyage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
