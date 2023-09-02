import 'package:MyBudget/models/expance.dart';
import 'package:MyBudget/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expances});

  final List<Expance> expances;

  List<ExpanceBucket> get buckets {
    return [
      ExpanceBucket.forCategory(expances, Category.food),
      ExpanceBucket.forCategory(expances, Category.leisure),
      ExpanceBucket.forCategory(expances, Category.travel),
      ExpanceBucket.forCategory(expances, Category.work),
    ];
  }

  double get totalExpences {
    double total = 0;
    for (final bucket in buckets) {
      total += bucket.totalExpances;
    }
    return total;
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpances > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpances;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpances == 0
                        ? 0
                        : bucket.totalExpances / totalExpences,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Text(
                            '${bucket.totalExpances.toStringAsFixed(2)+"\€"}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Icon(
                            categoryIcons[bucket.category],
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
