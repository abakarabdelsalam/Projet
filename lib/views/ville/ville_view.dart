import 'package:PlningVyage/models/activity_model.dart';
import 'package:PlningVyage/models/trip_model.dart';
import 'package:PlningVyage/models/ville_model.dart';
import 'package:PlningVyage/views/ville/widgets/trip_activity_liste.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart' as data;
import 'widgets/activity_List.dart';

import 'widgets/trip_overview.dart';

class VilleView extends StatefulWidget {
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
  _VilleViewState createState() => _VilleViewState();
}

class _VilleViewState extends State<VilleView> {
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
    final Ville ville = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation du voyage'),
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
              villeName: ville.name,
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
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Découverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text('Mes activités'),
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}
