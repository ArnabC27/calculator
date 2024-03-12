import "package:calculator/colors.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.cyan,
              )
          ),
          Row(
            children: [
              button(),
            ],
          )
        ],
      ),
    );
  }

  Widget button() {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(22),
                backgroundColor: buttonColor
            ),
            onPressed: () {},
            child: const Text(
              "Hello",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
    );
  }
}
