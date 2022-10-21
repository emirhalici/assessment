import 'package:assessment/features/home/model/lead_model.dart';
import 'package:assessment/features/home/widgets/lead_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<LeadModel> models = [
    LeadModel(
      firstName: 'Alice',
      lastName: 'Anderson',
      address: '123 Fake Street',
      assignedManagerName: 'Susie Queen',
    ),
    LeadModel(
      firstName: 'John',
      lastName: 'Adams',
      address: 'Beverly Hills',
      assignedManagerName: 'Tom Hanks',
    ),
    LeadModel(
      firstName: 'Justin',
      lastName: 'Anderson',
      address: '123 Fake Street',
      assignedManagerName: 'Susie Queen',
    ),
    LeadModel(
      firstName: 'Alice',
      lastName: 'Anderson',
      address: '123 Fake Street',
      assignedManagerName: 'Susie Queen',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (_, index) {
          final model = models[index];

          return LeadWidget(model: model);
        },
      ),
    );
  }
}
