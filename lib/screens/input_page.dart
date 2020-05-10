
import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/Reusable_Card.dart';
import 'package:bmicalculator/components/Reusable_Card_Child.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/components/round_icon.dart';

enum gender{male, female}
enum operation{add, sub}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  int minHeight = 120;
  int maxHeight = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedGender==gender.male?kActivecolour:kInactivecolour,
                      cardChild: ReusableCardChild(
                        myIcon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                  ),
                ),

              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedGender==gender.female?kActivecolour:kInactivecolour,
                      cardChild: ReusableCardChild(
                        myIcon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: kActivecolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT',style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                            height.toString(),
                            style: kNumberTextStyle,
                            ),
                            Text('cm',
                            style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x1feb1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xff8d8e98),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 23.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: minHeight.toDouble(),
                            max: maxHeight.toDouble(),
                            onChanged: (double newHeight){
                                setState(() {
                                  height = newHeight.round();
                                });
                            },
                          ),
                        )

                      ],
                    ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour: kActivecolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kLabelTextStyle,),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    colour: kActivecolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',style: kLabelTextStyle,),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          onPressed:(){
                              setState(() {
                                age--;
                              });
                          } ,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed:(){
                              setState(() {
                                age++;
                              });
                            } ,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          BottomButton(
            onTap: (){
              CalculatorBrain cb = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                bmiValue: cb.CalculateBMI(),
                text: cb.getResult(),
                interpretation: cb.interpretation(),
              )
              )
              );
            },
            text: 'CALCULATE',
          ),
        ],
      )
    );
  }
}






