import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expances extends StatefulWidget {
  const Expances({super.key});

  @override
  State<Expances> createState() {
    return _ExpancesState();
  }}

class _ExpancesState extends State<Expances> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Text("hallo world"), 
      ),
    );
  }
}
