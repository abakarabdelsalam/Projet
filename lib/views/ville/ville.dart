import 'package:PlningVyage/models/activity.model.dart';
import 'package:PlningVyage/models/trip.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/data.dart' as data;
import 'widgets/activity_card.dart';

class Ville extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  Trip mytrip = Trip(activities: [], ville: 'paris', date: DateTime.now());
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(1),
              height: 100,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(DateFormat('d/M/y').format(mytrip.date)),
                      ),
                      RaisedButton(
                        child: Text('Sélectionnez une date'),
                        onPressed: () => {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: widget.activities
                    .map((activity) => ActivityCard(activity: activity))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  DateFormat buildDateFormat() => DateFormat('d/M/y');
}
