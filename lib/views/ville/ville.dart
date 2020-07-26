import 'package:PlningVyage/models/activity.model.dart';
import 'package:PlningVyage/models/trip.model.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart' as data;
import 'widgets/activity_List.dart';

import 'widgets/trip_overview.dart';

class Ville extends StatefulWidget {
  final List<Activity> activities = data.activities;
  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  Trip mytrip = Trip(activities: [], ville: 'Paris', date: DateTime.now());

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2022),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Organisation du voyage'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(
              mytrip: mytrip,
              setDate: setDate,
            ),
            Expanded(
              child: ActivityList(
                activities: widget.activities,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_comment),
          title: Text('Découverte'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo),
          title: Text('Mes activités'),
        )
      ]),
    );
  }
}
