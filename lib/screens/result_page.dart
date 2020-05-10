
import '../screens/input_page.dart';
import 'package:flutter/material.dart';
import '../components/Reusable_Card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';


class ResultsPage extends StatelessWidget {
  final String bmiValue;
  final String text;
  final String interpretation;

  ResultsPage({@required this.bmiValue, @required this.text, @required this.interpretation}){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text('YOUR RESULT',

                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivecolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiValue,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
            },
            text: 'RE-CALCULATE',
          ),
        ],
      )
    );
  }
}
