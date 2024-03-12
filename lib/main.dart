import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
      MaterialApp(
        home: CalculatorApp(),
      )
  );
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.red,
              )
          ),
        ],
      ),
    );
  }
}
