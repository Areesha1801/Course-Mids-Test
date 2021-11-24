double a = 0;
double totalYears;
double years;
double actualAmount;
double gpf;

class CalBrain {
  void calculate(var days, int deductAmount) {
    totalYears = daysToYears(days);
    actualAmount = (deductAmount * (totalYears / 12));
    gpf = actualAmount + ((actualAmount * (totalYears / 12)) / 100);
  }

  double daysToYears(var days) {
    years = days / 365;
    return years;
  }

  String actualAmountt() {
    return actualAmount.toStringAsFixed(2);
  }

  String gpfAmountt() {
    return actualAmount.toStringAsFixed(2);
  }
}
