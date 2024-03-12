import "package:calculator/colors.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:math_expressions/math_expressions.dart";

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
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 30.0;

  onButtonClick(value) {
    print(value);

    if (value == 'AC') {
      input = '';
      output = '';
    }
    else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    }
    else if (value == '=') {
      if(input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = exp.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith('.0')) {
          output = output.substring(0, output.length-2);
        }
        input = output;

      }
    }
    else {
      input = input + value;
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    const IconData backspace = IconData(0xe0c5, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      hideInput ? '' : input,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: outputSize,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
          ),
          Row(
            children: [
              button(text: 'AC', textColor: orangeColor, buttonBgColor: operatorColor),
              button(text: '<', textColor: orangeColor, buttonBgColor: operatorColor),
              button(text: '+/-', buttonBgColor: operatorColor),
              button(text: '/', buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: 'x', buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: '-', buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '+', buttonBgColor: operatorColor),
            ],
          ),
          Row(
            children: [
              button(text: '%', buttonBgColor: operatorColor),
              button(text: '0'),
              button(text: '.', buttonBgColor: operatorColor),
              button(text: '=', buttonBgColor: orangeColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, textColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(22),
                backgroundColor: buttonBgColor
            ),
            onPressed: () => onButtonClick(text),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
    );
  }
}
