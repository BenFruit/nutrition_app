import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, [this.childProp]);
  final int colour;
  final Widget? childProp;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childProp,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(colour),
      ),
    );
  }
}
