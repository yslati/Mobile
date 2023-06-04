import 'package:calculator_proj/model/buttonItemModel.dart';
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
      debugShowCheckedModeBanner: false,
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
  String history = "0";
  String textToDisplay = "0";
  String operation = "";
  int len = 0;

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  String calcul() {
    String op = history.replaceAll('x', '*') + textToDisplay;
    Expression exp = Parser().parse(op);
    double answer = exp.evaluate(EvaluationType.REAL, ContextModel());
    return answer.toString();
  }

  void btnOnClick(String btnVal) {
    debugPrint('button pressed :$btnVal');
    if (btnVal == 'C') {
      textToDisplay = "0";
      len = 0;
      operation = "";
    } else if (btnVal == 'AC') {
      textToDisplay = "0";
      history = "0";
      operation = "";
      len = 0;
    } else if (btnVal == "+/-") {
      if (textToDisplay == "0") {
        textToDisplay;
      } else if (textToDisplay[0] != '-') {
        textToDisplay = '-$textToDisplay';
      } else {
        textToDisplay = textToDisplay.substring(1);
      }
    } else if (btnVal == '.') {
      if (!textToDisplay.contains('.') &&
          textToDisplay[textToDisplay.length - 1] != '.') {
        textToDisplay = '$textToDisplay.';
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      if ((history != "0" || textToDisplay != "0")) {
        if (len == 0) {
          if (isOperator(history[history.length - 1])) {
            history = history.replaceAll(history[history.length - 1], btnVal);
          } else {
            history += btnVal;
          }
        } else {
          if (history == "0" || (history != "0" && operation != "")) {
            history = calcul() + btnVal;
          } else {
            history += btnVal;
            history = calcul();
          }
          len = 0;
        }
        textToDisplay = "0";
        operation = btnVal;
      } else if (len != 0 && history == "0") {
        history = textToDisplay + btnVal;
        operation = btnVal;
      }
    } else if (btnVal == "=") {
      if (operation != "" && len != 0) {
        history = calcul();
        textToDisplay = "0";
        operation = "";
        len = 0;
      }
    } else if (textToDisplay.length >= 13) {
      textToDisplay;
    } else {
      len++;
      if (textToDisplay == "0") {
        if (btnVal == "00") {
          textToDisplay;
        } else {
          textToDisplay = btnVal;
        }
      } else {
        textToDisplay += btnVal;
      }
    }
    setState(() {
      textToDisplay;
      history;
    });
  }

  final List<ButtonItemModel> _items = [
    ButtonItemModel(
      text: 'AC',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(
      text: 'C',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(
      text: '+/-',
      textColor: Colors.black,
      fillColor: Colors.white60,
      textSize: 24,
    ),
    ButtonItemModel(
      text: '/',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '7',
    ),
    ButtonItemModel(
      text: '8',
    ),
    ButtonItemModel(
      text: '9',
    ),
    ButtonItemModel(
      text: 'x',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '4',
    ),
    ButtonItemModel(
      text: '5',
    ),
    ButtonItemModel(
      text: '6',
    ),
    ButtonItemModel(
      text: '+',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '1',
    ),
    ButtonItemModel(
      text: '2',
    ),
    ButtonItemModel(
      text: '3',
    ),
    ButtonItemModel(
      text: '-',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(text: '0'),
    ButtonItemModel(text: '.'),
    ButtonItemModel(text: '00'),
    ButtonItemModel(
      text: '=',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
  ];

  final List<ButtonItemModel> _items_portrait = [
    ButtonItemModel(
      text: '/',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: 'x',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '-',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '+',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: 'AC',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(text: '6'),
    ButtonItemModel(text: '7'),
    ButtonItemModel(text: '8'),
    ButtonItemModel(text: '9'),
    ButtonItemModel(
      text: 'C',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(text: '2'),
    ButtonItemModel(text: '3'),
    ButtonItemModel(text: '4'),
    ButtonItemModel(text: '5'),
    ButtonItemModel(
      text: '+/-',
      textColor: Colors.black,
      fillColor: Colors.white60,
      textSize: 24,
    ),
    ButtonItemModel(text: '0'),
    ButtonItemModel(text: '1'),
    ButtonItemModel(text: '.'),
    ButtonItemModel(text: '00'),
    ButtonItemModel(
      text: '=',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
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
        padding: EdgeInsets.only(
          left: isPortrait ? 5 : 10,
          right: isPortrait ? 5 : 10,
        ),
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: isPortrait
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                      ),
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(
                        history,
                        style: TextStyle(
                            fontSize: isPortrait ? 22 : 18,
                            color: Colors.white70),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomEnd,
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        textToDisplay,
                        style: TextStyle(
                          fontSize: isPortrait ? 44 : 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrait ? 4 : 5,
                  childAspectRatio: 1,
                  mainAxisExtent: isPortrait ? 80 : 50,
                  crossAxisSpacing: isPortrait ? 0 : 15,
                ),
                itemBuilder: (context, index) {
                  return CalcButton(
                    item: isPortrait ? _items[index] : _items_portrait[index],
                    isPortrait: isPortrait,
                    callback: btnOnClick,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
