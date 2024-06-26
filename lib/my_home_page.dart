import "package:MyBudget/contact.dart";
import "package:MyBudget/expances.dart";
import "package:MyBudget/profile.dart";
import "package:convex_bottom_bar/convex_bottom_bar.dart";
import "package:flutter/material.dart";
int selectedPage = 0;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageNo = [const Expances(), Contact(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNo[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        height: 50,
        top: -10,
        //curveSize: 30,
        elevation: 10,
        //cornerRadius: 10,
        backgroundColor: Theme.of(context).cardTheme.color,
        color: Theme.of(context).iconTheme.color,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Contact'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),

    );
  }
}
