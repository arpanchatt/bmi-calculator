import 'package:flutter/material.dart';
import 'inputPage.dart';

void main(List<String> args) {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  Widget build(BuildContext b) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderThemeData(
          thumbColor: Color(0xFFEB1555),
          activeTrackColor: Color(0xFFFFFFFF),
          inactiveTrackColor: Color(0xFF8D8E98),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
          overlayColor: Color(0x40EB1555),
          overlayShape: RoundSliderOverlayShape(
            overlayRadius: 25.0,
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
