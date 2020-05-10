import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String text;
  BottomButton({@required this.onTap, @required this.text}){}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(text,
            style: kLargeButtonStyle
        ),
        ),
        color: kBottomContcolour,
        margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
        width: double.infinity,
        height: kBottomContHeight,
      ),
    );
  }
}