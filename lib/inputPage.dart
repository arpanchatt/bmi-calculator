import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'create_card.dart';
import 'gender_selection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Round_button.dart';
import 'calculator_brain.dart';
import 'result_page.dart';

const int inactiveColor = 0xFF111328;
const int activeColor = 0xFF1D1E33;
const TextStyle styleText = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const TextStyle displayText = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

int height = 150;
int weight = 50;
int age = 20;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;

  int setValue(int value, int limit) {
    setState(() {
      if (value > limit) {
        value--;
      } else if (value < limit) {
        value++;
      }
    });
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: Color(
                        gender == Gender.male ? activeColor : inactiveColor),
                    child: GenderSelection(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                      styles: styleText,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: Color(
                        gender == Gender.female ? activeColor : inactiveColor),
                    child: GenderSelection(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                      styles: styleText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: styleText,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: displayText,
                      ),
                      Text(
                        'cm',
                        style: styleText,
                      ),
                    ],
                  ),
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                  ),
                ],
              ),
              colour: Color(activeColor),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: styleText,
                        ),
                        Text(
                          weight.toString(),
                          style: displayText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                weight = setValue(weight, 20);
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                weight = setValue(weight, 150);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(activeColor),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: styleText,
                        ),
                        Text(
                          age.toString(),
                          style: displayText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                age = setValue(age, 10);
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                age = setValue(age, 100);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: Color(activeColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                CalculatorBrain cb =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      calculation: cb.calculateBMI(),
                      interpretation: cb.getInterpretation(),
                      title: cb.getResult(),
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color(0xFFEB1555),
                ),
              ),
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            height: 70.0,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          ),
        ],
      ),
    );
  }
}
