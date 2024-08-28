class BMiCalculator {
  late double bmiRes;
  late int height;
  late int weight;

  BMiCalculator._internal();

  static final BMiCalculator _bmiCalculatorInstance = BMiCalculator._internal();

  factory BMiCalculator() {
    return _bmiCalculatorInstance;
  }

  void reCalculate() {
    double newHeight = height / 100;
    bmiRes = weight / (newHeight * newHeight);
  }
}
