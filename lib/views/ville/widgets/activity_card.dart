import 'package:PlningVyage/models/activity.model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
      margin: EdgeInsets.all(5),
    );
  }
}
