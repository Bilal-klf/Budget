import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 28,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Général"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_circle_rounded),
                          SizedBox(width: 10),
                          Text("Mon compte"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 28,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Sécurité"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock),
                          SizedBox(width: 10),
                          Text("Securité et accès au compte"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.security_rounded),
                          SizedBox(width: 10),
                          Text("Confidentialité et sécurité"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 28,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Notification"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications_active),
                          SizedBox(width: 10),
                          Text("Notification"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 28,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Accessibilité"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.accessibility),
                          SizedBox(width: 10),
                          Text("Accessibilité, affichage et langues"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 28,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Aide"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gesture Detected!')));
              },
              child: Card(
                margin: EdgeInsets.all(2),
                shape: LinearBorder(side: BorderSide.none),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.help),
                          SizedBox(width: 10),
                          Text("Aide"),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text("Profile"),
        ),
      ),
    );
  }
}
