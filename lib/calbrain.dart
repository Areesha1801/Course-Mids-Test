double a = 0;

class CalBrain {
  void showResult(double x) {
    a = x;
  }

  String calResult() {
    return a.toStringAsFixed(2);
  }
}
