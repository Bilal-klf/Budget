import "package:flutter/material.dart";

import "../models/expance.dart";


class TotalExpances extends StatelessWidget {
  TotalExpances({super.key, required this.totalExpances});


  double _total(){
    double total = 0;
    for(final expance in totalExpances){
      total+= expance.amount;
      }
    return total;
  }

  List<Expance> totalExpances;
  @override
  Widget build(BuildContext context) {
    double totalExpances = _total();
    return Row(children: [Text(totalExpances.toStringAsFixed(2)+"\€",style: const TextStyle(color: Colors.white,fontSize: 30),)],);
  }

}