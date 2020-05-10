import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCardChild extends StatelessWidget {
  final IconData myIcon;
  final String label;
  ReusableCardChild({this.myIcon, this.label}){}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}