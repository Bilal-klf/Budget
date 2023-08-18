import 'package:MyBudget/expances_list.dart';
import 'package:MyBudget/models/expance.dart';
import 'package:MyBudget/new_expance.dart';
import 'package:flutter/material.dart';

class Expances extends StatefulWidget {
  const Expances({super.key});

  @override
  State<Expances> createState() {
    return _ExpancesState();
  }
}

class _ExpancesState extends State<Expances> {
  final List<Expance> _registeredExpances = [
    Expance(
        title: "casino",
        amount: 12.99,
        date: DateTime.now(),
        category: Category.food),
    Expance(
        title: "darty",
        amount: 12.99,
        date: DateTime.now(),
        category: Category.travel)
  ];

  void _addNewExpance(Expance expance) {
    setState(() {
      _registeredExpances.add(expance);
    });
  }

  void _onAddNewExpance() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>
          Container(width: double.infinity,
            child: NewExpence(onAddExpance: _addNewExpance),),);
  }

  void _removeExpance(Expance expance){
    setState(() {
      _registeredExpances.remove(expance);
      print(_registeredExpances.length);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes dépences"),
        actions: [
          IconButton(
            onPressed: _onAddNewExpance,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      //backgroundColor: Colors.white,
      body: Column(children: [
        const Text("the list"),
        Expanded(
          child: ExpancesList(expances: _registeredExpances,onRemoveExpance: _removeExpance),
        ),
      ]),
    );
  }
}
