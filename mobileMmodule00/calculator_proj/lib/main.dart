import 'package:calculator_proj/widgets/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNum = 0;
  int secondNum = 0;
  String history = "0";
  String textToDisplay = "0";
  String res = "";
  String operation = "";

  String checkOpration(int num1, String op, int num2) {
    String output = "";
    Expression exp = Parser().parse("$num1 $operation $num2");
    output = exp.toString();
    // if (op == '+') {
    //   output = (num1 + num2).toString();
    //   history = num1.toString() + op.toString() + num2.toString();
    // } else if (op == '-') {
    //   output = (num1 - num2).toString();
    //   history = num1.toString() + op.toString() + num2.toString();
    // } else if (op == 'x') {
    //   output = (num1 * num2).toString();
    //   history = num1.toString() + op.toString() + num2.toString();
    // } else if (op == '/') {
    //   output = (num1 / num2).toString();
    //   history = num1.toString() + op.toString() + num2.toString();
    // }
    return output;
  }

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = "0";
      res = "0";
    } else if (btnVal == 'AC') {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = "0";
      res = "0";
      history = "0";
    } else if (btnVal == "+/-") {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '.') {
      if (textToDisplay.contains('.')) {
        res = res;
      } else if (textToDisplay[textToDisplay.length - 1] != '.') {
        res = '$textToDisplay.';
      } else {
        res = textToDisplay.substring(0, textToDisplay.length - 1);
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      res = '0';
      operation = btnVal;
      if (firstNum == 0) {
        firstNum = int.parse(textToDisplay);
      } else {
        firstNum = int.parse(checkOpration(
            firstNum, history[history.length - 1], int.parse(textToDisplay)));
      }
      history = firstNum.toString() + operation;
    } else if (btnVal == "=") {
      secondNum = int.parse(textToDisplay);
      res = checkOpration(firstNum, operation, secondNum);
      operation = "";
    } else {
      if (textToDisplay.contains('.')) {
        res = textToDisplay + btnVal;
      } else {
        res = int.parse(textToDisplay + btnVal).toString();
      }
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  history,
                  style: TextStyle(fontSize: 22, color: Colors.white70),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 44, color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: 'AC',
                  textColor: Colors.red,
                  fillColor: Colors.white60,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: 'C',
                  textColor: Colors.red,
                  fillColor: Colors.white60,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '+/-',
                  textColor: Colors.black,
                  fillColor: Colors.white60,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '/',
                  textColor: Colors.white,
                  fillColor: Colors.orangeAccent,
                  textSize: 34,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '7',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '8',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '9',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: 'x',
                  textColor: Colors.white,
                  fillColor: Colors.orangeAccent,
                  textSize: 34,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '4',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '5',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '6',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '+',
                  textColor: Colors.white,
                  fillColor: Colors.orangeAccent,
                  textSize: 34,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '1',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '2',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '3',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '-',
                  textColor: Colors.white,
                  fillColor: Colors.orangeAccent,
                  textSize: 34,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: '0',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '.',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '00',
                  textColor: Colors.white,
                  fillColor: Colors.white12,
                  textSize: 26,
                  callback: btnOnClick,
                ),
                CalcButton(
                  text: '=',
                  textColor: Colors.white,
                  fillColor: Colors.orangeAccent,
                  textSize: 34,
                  callback: btnOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
