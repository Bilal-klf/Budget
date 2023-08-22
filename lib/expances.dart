import 'package:MyBudget/expances_list.dart';
import 'package:MyBudget/models/expance.dart';
import 'package:MyBudget/new_expance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      builder: (ctx) => Container(
        width: double.infinity,
        child: NewExpence(onAddExpance: _addNewExpance),
      ),
    );
  }

  void _removeExpance(Expance expance, ctx, bool confirm) {
    if (confirm == true) {
      setState(() {
        _registeredExpances.remove(expance);
        Navigator.pop(ctx);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            content: Center(child: Text("Item removed")),
          ),
        );
      });
    } else {
      /*setState(() {
        Navigator.pop(ctx);
      });*/
      Navigator.pop(ctx);
    }
  }

  void _removeConfirmation(Expance expance) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          title: Center(
              child: Text(
            "Are you sure you want to delete this item?",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          )),
          icon: const Icon(Icons.delete, color: Colors.red, size: 40),
          backgroundColor: Colors.lightBlue,
          actions: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _removeExpance(expance, ctx, true);
                    },
                    child: const Text("Yes")),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _removeExpance(expance, ctx, false);
                      });
                    },
                    child: const Text("No")),
              ],
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Container(

        child: const Row(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("no expance, press"),
            Icon(Icons.add),
            Text("to add new one"),
          ],
        ),
      ),
    );
    if (_registeredExpances.isNotEmpty) {
      mainContent = ExpancesList(
            expances: _registeredExpances,
            onRemoveExpance: _removeConfirmation);
    }

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
        Text(
          "My list",
          style: GoogleFonts.lato(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: mainContent,
        ),
      ]),
    );
  }
}
