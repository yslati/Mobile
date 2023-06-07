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
  String result = "0";

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  String calcul() {
    String op = history.replaceAll('x', '*');
    Expression exp = Parser().parse(op);
    double answer = exp.evaluate(EvaluationType.REAL, ContextModel());
    return answer.toString();
  }

  void btnOnClick(String btnVal) {
    debugPrint('button pressed :$btnVal');
    if (btnVal == 'C') {
      if (history.length >= 1 && history != '0') {
        history = history.substring(0, history.length - 1);
        if (history == '') {
          history = "0";
        }
      }
    } else if (btnVal == 'AC') {
      result = "0";
      history = "0";
    } else if (btnVal == "+/-") {
      if (history == "0") {
        history = "-";
      } else if (history[history.length - 1] == '-') {
        history = history.substring(0, history.length - 1);
      } else {
        history += "-";
      }
    } else if (btnVal == '.') {
      if (history[history.length - 1] != '.') {
        history = '$history.';
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      if (result != "0") {
        history = result + btnVal;
        result = "0";
      } else {
        if (history.length < 2 && isOperator(history[0])) {
          history;
        } else if (isOperator(history[history.length - 1])) {
          if (!isOperator(history[history.length - 2])) {
            history = history.replaceAll(history[history.length - 1], btnVal);
          }
        } else {
          history += btnVal;
        }
      }
    } else if (btnVal == "=") {
      if (history.length >= 3 && !isOperator(history[history.length - 1])) {
        result = calcul();
      }
    } else if (history.length >= 17) {
      history;
    } else {
      if (result != "0") {
        history = "0";
        result = "0";
      }
      if (history == "0") {
        if (btnVal == "00") {
          history;
        } else {
          history = btnVal;
        }
      } else {
        history += btnVal;
      }
    }
    setState(() {
      result;
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

  final List<ButtonItemModel> _itemsPortrait = [
    ButtonItemModel(text: '7'),
    ButtonItemModel(text: '8'),
    ButtonItemModel(text: '9'),
    ButtonItemModel(
      text: 'AC',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(
      text: '+',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(text: '4'),
    ButtonItemModel(text: '5'),
    ButtonItemModel(text: '6'),
    ButtonItemModel(
      text: 'C',
      textColor: Colors.red,
      fillColor: Colors.white60,
    ),
    ButtonItemModel(
      text: '-',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(text: '1'),
    ButtonItemModel(text: '2'),
    ButtonItemModel(text: '3'),
    ButtonItemModel(
      text: '+/-',
      textColor: Colors.black,
      fillColor: Colors.white60,
      textSize: 24,
    ),
    ButtonItemModel(
      text: 'x',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(text: '0'),
    ButtonItemModel(text: '00'),
    ButtonItemModel(text: '.'),
    ButtonItemModel(
      text: '=',
      textColor: Colors.white,
      fillColor: Colors.orangeAccent,
      textSize: 30,
    ),
    ButtonItemModel(
      text: '/',
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
                        result,
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
                  mainAxisExtent: isPortrait ? 100 : 50,
                  crossAxisSpacing: isPortrait ? 0 : 15,
                ),
                itemBuilder: (context, index) {
                  return CalcButton(
                    item: isPortrait ? _items[index] : _itemsPortrait[index],
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
