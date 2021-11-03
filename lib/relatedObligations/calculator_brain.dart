import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({required this.weight, required this.height});
  double _bmi = 0;
  String calculateBMI() {
    print('$weight $height');
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OVERWEIGHT';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getAdvice() {
    if (_bmi >= 25)
      return 'You have higher than normal body weight. '
          'Exercise and become more fit and try low-calorie nutrition ';
    else if (_bmi > 18.5)
      return 'Excellent! Your body weight is normal. Keep it up!';
    else
      return 'You are underweight. You should exercise and eat a lot more food'
          'than you do';
  }
}
