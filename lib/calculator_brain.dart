import 'dart:math';

class CalculatorBrain{
  double _bmiValue;
  String result;
  int height, weight;

  CalculatorBrain({int height, int weight}){
    _bmiValue = 0.0;
    this.height = height;
    this.weight = weight;
  }

  String calculateBMI(){
    _bmiValue = weight/pow((height/100),2);
    return _bmiValue.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmiValue < 18.5)
      result = 'Underweight';
    else if(_bmiValue>=18.5 && _bmiValue<=24.9)
      result = 'Normal';
    else if(_bmiValue>=25 && _bmiValue<=29.9)
      result = 'Overweight';
    else
      result = 'Obesity';
    return result;
  }


  String getInterpretation(){
    if(_bmiValue < 18.5)
      result = 'Your BMI is quite low, you should eat more';
    else if(_bmiValue>=18.5 && _bmiValue<=24.9)
      result = 'Congratulations, your BMI is normal';
    else if(_bmiValue>=25 && _bmiValue<=29.9)
      result = 'Warning, your BMI is a bit abnormal, control your diet';
    else
      result = 'Danger, your BMI is quite high,control eating immediately';
    return result;
  }

}