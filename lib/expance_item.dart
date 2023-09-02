import 'package:flutter/material.dart';

import 'models/expance.dart';

class ExpanceItem extends StatelessWidget {
  ExpanceItem(this.expance, {super.key});

  Expance expance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(crossAxisAlignment : CrossAxisAlignment.start, children: [
            Text(expance.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('${expance.amount.toStringAsFixed(2)+"\€"}'),
                const Spacer(),
                Row(children: [
                  Icon(categoryIcons[expance.category]),
                  const SizedBox(width: 8),
                  Text(expance.formattedDate)
                ]),
              ],
            ),
          ])),
    );
  }
}
