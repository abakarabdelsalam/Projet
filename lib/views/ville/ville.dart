import 'package:PlningVyage/models/activity.model.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart' as data;
import 'widgets/activity_card.dart';

class Ville extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5,
          children: widget.activities
              .map((activity) => ActivityCard(activity: activity))
              .toList(),
        ),
      ),
    );
  }
}
