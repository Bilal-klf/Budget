import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [Text("Name")],
              ),
              Row(
                children: [
                  Text("Bilal KHELLAF"),
                ],
              ),
            ],
          ),
        ),
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
