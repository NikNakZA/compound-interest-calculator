import 'package:flutter/material.dart';

class CompoundInterestCalculator {

  double initialAmount;
  double percentageAmount;
  double amountOfYears;
  bool ifMonths;

  CompoundInterestCalculator(
      this.initialAmount,
      this.percentageAmount,
      this.amountOfYears,
      this.ifMonths,
      );


  //Calculation method:


  List<String> calculation () {
    List<String> accumulatedYearlyInterest = [];

    double multiplier = 1 + (percentageAmount/100);
    double finalAmount = initialAmount;
    double totalInterest = 0;
    String totalInterestFormat = "";

    for (int i = 1; (i) <= (amountOfYears); i++) {
      double finalAmountTemp = finalAmount;

      finalAmount = finalAmount * multiplier;
      double periodInterest = finalAmount - finalAmountTemp;

      totalInterest += periodInterest;

      String finalAmountFormat = finalAmount.toStringAsFixed(2);
      String periodInterestFormat = periodInterest.toStringAsFixed(2);
      totalInterestFormat = totalInterest.toStringAsFixed(2);

      if (ifMonths == false) {
        accumulatedYearlyInterest.add(" Year $i: $finalAmountFormat \n Period interest: $periodInterestFormat\n\n");
      }
      else {
        accumulatedYearlyInterest.add(" Month $i: $finalAmountFormat \n Period interest: $periodInterestFormat\n\n");
      }
    }

    accumulatedYearlyInterest.add("Total Interest: $totalInterestFormat");
    return accumulatedYearlyInterest;
  }
}
