import 'package:flutter/material.dart';
import 'compoundinterestcalculator.dart';

void main() {
  runApp(const MaterialApp(
    home: CICalculator(),
  ));
}

class CICalculator extends StatefulWidget {
  const CICalculator({super.key});

  @override
  State<CICalculator> createState() => _CICalculatorState();
}

class _CICalculatorState extends State<CICalculator> {

  final _textController = TextEditingController(); //receives user input, 1st box
  final _textControllerTwo = TextEditingController(); //2nd box
  final _textControllerThree = TextEditingController(); //3rd box

  double initialAmount = 0;
  double percentageAmount = 0;
  double amountOfYears = 0;

  String resultsText = "";

  bool ifMonths = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const BottomAppBar(
        color: Colors.grey, height: 36, child: Center(
          child: Text(
          "NikNak Software Compound Interest Calculator v0.5", //Signature and version text
          style: TextStyle(color: Colors.white, fontSize: 10),
                ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Center(child: Text("Compound Interest Calculator",
        style: TextStyle(color: Colors.white, fontSize: 24),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8,40,8,0),
            child: Text("Initial amount:",
                style: TextStyle(fontSize: 22),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: TextField(
              controller: _textController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, height: 1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8,8,8,0),
            child: Text("Percentage amount:",
            style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: TextField(
              controller: _textControllerTwo,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: OutlineInputBorder(),
              hintText: "%"
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, height: 1),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8,8,8,0),
            child: Text("Amount of years:",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,40),
            child: TextField(
              controller: _textControllerThree,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18, height: 1),
        
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                initialAmount = double.parse(_textController.text);
                percentageAmount = double.parse(_textControllerTwo.text);
                amountOfYears = double.parse(_textControllerThree.text);
        
                var results = CompoundInterestCalculator(initialAmount, percentageAmount, amountOfYears);
                List<dynamic>? resultsList = results.Calculation();
                resultsText = resultsList.toString();
              });
            },
            height: 50, minWidth: 200,
            color: Colors.amber,
            child: const Text("Calculate",
              style: TextStyle(fontSize: 22),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,40,8,40),
            child: Text(resultsText,
            style: const TextStyle(
            fontSize: 20,
              height: 1.5,
            ),
            ),
          )
        ],),
      ),
    );
  }
}




