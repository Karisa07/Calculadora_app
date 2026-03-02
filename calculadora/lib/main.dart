import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void onButtonPress(String value) {
    setState(() {
      if (value == "AC") {
        display = "0";
        num1 = 0;
        num2 = 0;
        operator = "";
      } 
      else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        num1 = double.parse(display);
        operator = value;
        display = "0";
      } 
      else if (value == "=") {
        num2 = double.parse(display);

        switch (operator) {
          case "+":
            display = (num1 + num2).toString();
            break;
          case "-":
            display = (num1 - num2).toString();
            break;
          case "×":
            display = (num1 * num2).toString();
            break;
          case "÷":
            display = (num1 / num2).toString();
            break;
        }
      } 
      else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget buildButton(String text, {Color? color, Color textColor = Colors.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () => onButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[700],
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(22),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 22, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Pantalla
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                display,
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ),

          // Botones
          Row(children: [
            buildButton("AC", color: Colors.grey),
            buildButton("+/-", color: Colors.grey),
            buildButton("%", color: Colors.grey),
            buildButton("÷", color: Colors.orange),
          ]),
          Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("×", color: Colors.orange),
          ]),
          Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("-", color: Colors.orange),
          ]),
          Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("+", color: Colors.orange),
          ]),
          Row(children: [
            buildButton("0"),
            buildButton("."),
            buildButton("=", color: Colors.orange),
          ]),
        ],
      ),
    );
  }
}