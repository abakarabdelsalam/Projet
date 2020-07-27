import 'package:PlningVyage/models/activity.model.dart';
import 'package:PlningVyage/views/ville/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function toggleActivity;
  final List<String> selectedActivities;

  ActivityList({this.activities, this.toggleActivity, this.selectedActivities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: activities
          .map(
            (activity) => ActivityCard(
              activity: activity,
              isSelected: selectedActivities.contains(activity.id),
              toggleActivity: () => toggleActivity(activity.id),
            ),
          )
          .toList(),
    );
  }
}
