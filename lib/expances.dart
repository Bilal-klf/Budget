import 'package:MyBudget/expances_list.dart';
import 'package:MyBudget/models/expance.dart';
import 'package:MyBudget/new_expance.dart';
import 'package:MyBudget/widgets/chart.dart';
import 'package:MyBudget/widgets/total_expances.dart';
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
      useSafeArea: true,
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          expances: _registeredExpances, onRemoveExpance: _removeConfirmation);
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
      body: width < 600
          ? Column(children: [
              Container(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "Expences",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TotalExpances(
                            totalExpances: _registeredExpances,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Expanded(child: Chart(expances: _registeredExpances)),
              Chart(expances: _registeredExpances),
              Expanded(
                child: mainContent,
              ),
            ])
          : Row(children: [
              Expanded(
                  child: TotalExpances(
                totalExpances: _registeredExpances,
              )),
              Expanded(child: Chart(expances: _registeredExpances)),
              Expanded(
                child: mainContent,
              ),
            ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.cyan,
        selectedLabelStyle: new TextStyle(color : Colors.cyan),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard_outlined, color: Colors.white,),
            label: 'Home',
            activeIcon: new Icon(Icons.dashboard_outlined, color: Colors.cyan,),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.help_outline_outlined, color: Colors.white,),
            activeIcon: new Icon(Icons.help_outline_outlined, color: Colors.cyan,),
            label: "help_icon_label",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Colors.white,),
              activeIcon: new Icon(Icons.message, color: Colors.cyan,),
              label: "messages_icon_label"
          )
        ],
      ),
    );
  }
}
