import 'package:flutter/material.dart';
import 'relatedObligations/constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icon, this.bottomText);
  final IconData icon;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 100,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          bottomText,
          style: styleOfText,
        )
      ],
    );
  }
}
