import 'package:PlningVyage/models/activity.model.dart';
import 'package:PlningVyage/models/trip.model.dart';
import 'package:PlningVyage/views/ville/widgets/trip_activity_liste.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart' as data;
import 'widgets/activity_List.dart';

import 'widgets/trip_overview.dart';

class Ville extends StatefulWidget {
  final List<Activity> activities = data.activities;

  showContext({BuildContext context, List<Widget> children}) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  _VilleState createState() => _VilleState();
}

class _VilleState extends State<Ville> {
  Trip mytrip;
  int index;
  List<Activity> activities;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], ville: 'Paris', date: null);
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

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

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Organisation de mes voyages'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              mytrip: mytrip,
              setDate: setDate,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_comment),
            title: Text('Découverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            title: Text('Mes activités'),
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
