import 'package:PlningVyage/models/activity.model.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  TripActivityList({this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var activity = activities[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(activity.image),
              ),
              title: Text(activity.name),
              trailing: Icon(Icons.cancel),
            ),
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}
