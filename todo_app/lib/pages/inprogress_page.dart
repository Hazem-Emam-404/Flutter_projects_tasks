import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';

class InProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<TaskProvider>(context);
    final list = prov.byStatus('inprogress');
    return SafeArea(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, i) => TaskCard(task: list[i]),
      ),
    );
  }
}
