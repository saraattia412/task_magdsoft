// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavDesign extends StatelessWidget {

   BottomNavDesign({Key? key}) : super(key: key);
final gap =const Opacity(
    opacity: 0,
    child: IconButton(onPressed:null , icon: Icon(Icons.no_cell)));

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:  const CircularNotchedRectangle(),
      notchMargin: 8,
      color: HexColor('#f2f2f2'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildDesign(index: 0, icon:const Icon(Icons.arrow_forward) ),
          buildDesign(index: 1, icon:const Icon(Icons.favorite) ),
          gap,
          buildDesign(index: 2, icon:const Icon(Icons.add_alert) ),
          buildDesign(index: 3, icon:const Icon(Icons.settings) ),

        ],

      ),
    );
  }


  Widget buildDesign({
  required int index,
    required Icon icon
})=>IconButton(
      onPressed: (){},
      icon: icon,
    color: Colors.grey,
  );
}
