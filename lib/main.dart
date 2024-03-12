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
                      'Input',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Input',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
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
            onPressed: () {},
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
