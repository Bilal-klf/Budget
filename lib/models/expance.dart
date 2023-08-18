import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid();
final formmater = DateFormat.yMd();
enum Category { food, travel, leisure, work }

const catergoryIcons = {
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
