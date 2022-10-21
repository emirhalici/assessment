import 'package:assessment/features/home/model/lead_model.dart';
import 'package:flutter/material.dart';

class LeadWidget extends StatelessWidget {
  final LeadModel model;
  const LeadWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        dense: true,
        title: Text(
          '${model.firstName} ${model.lastName}',
          style: textTheme.subtitle1,
        ),
        subtitle: Text(model.address),
        trailing: Text(model.assignedManagerName),
      ),
    );
  }
}

// ADDRESS
// NAMES
// PHONE NUMBER
// use ABROBAT