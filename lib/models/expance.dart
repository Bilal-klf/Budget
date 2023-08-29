import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formmater = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.card_travel_rounded,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expance {
  Expance(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formmater.format(date);
  }
}

class ExpanceBucket {
  ExpanceBucket({required this.category, required this.expances});
  ExpanceBucket.allCategories(this.expances) : this.category = Category.work;
  ExpanceBucket.forCategory(List<Expance> allExpances, this.category) : expances = allExpances.where((expance) => expance.category == category).toList();

  final Category category;
  final List<Expance> expances;

  double get totalExpances{
    double sum = 0;
    for (final expance in expances){
      sum = sum + expance.amount;
    }
    return sum;
  }
}
