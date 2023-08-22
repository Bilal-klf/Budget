import 'package:MyBudget/models/expance.dart';
import 'package:flutter/material.dart';

import 'expance_item.dart';

class ExpancesList extends StatelessWidget {
  ExpancesList({super.key, required this.expances,required this.onRemoveExpance});

  List<Expance> expances;
  final void Function(Expance expance) onRemoveExpance;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expances.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          onRemoveExpance(expances[index]);
        },
        key: UniqueKey(),
        child: ExpanceItem(expances[index]),
      ),
    );
  }
}
