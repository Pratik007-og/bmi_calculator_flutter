import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain{
  int height;
  int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight}){}

  String CalculateBMI(){
    _bmi = weight/pow(height/100.0, 2);
    return _bmi.toStringAsFixed(1); //we want just one decimal place ex:20.5
  }

  String getResult(){
    if(_bmi>=25)
      return 'Overweight';
    else if(_bmi>18.5)
            return 'Normal';
          else
            return 'Underweight';
  }

  String interpretation(){
    if(_bmi>=25)
      return 'Need to exercise more and maintain a healthy diet';
    else if(_bmi>18.5)
      return 'You are good to go. Keep it up!';
    else
      return 'Need to increase diet and intake of heavier diet';
  }


}
