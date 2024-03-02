import 'package:flutter/material.dart';

class CompoundInterestCalculator {

  double initialAmount;
  double percentageAmount;
  double amountOfYears;

  CompoundInterestCalculator(
      this.initialAmount,
      this.percentageAmount,
      this.amountOfYears
      );


  //Calculation method:


  List<dynamic>? Calculation () {
    List<dynamic> accumulatedYearlyInterest = [];

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

      accumulatedYearlyInterest.add("Year $i: $finalAmountFormat \n Period interest: $periodInterestFormat\n\n");
    }

    accumulatedYearlyInterest.add("Total Interest: $totalInterestFormat");
    return accumulatedYearlyInterest;
  }
}
