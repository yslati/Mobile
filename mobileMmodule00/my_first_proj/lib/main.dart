import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 0;

  void _textSwitcher() {
    setState(() {
      if (x == 0) {
        x = 1;
      } else {
        x = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> data = ["A  simple Text", "hello world!"];
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 78, 87, 0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              data[x],
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed');
                _textSwitcher();
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(212, 255, 255, 255),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text(
                'Click me',
                style: TextStyle(color: Color.fromARGB(255, 78, 87, 0)),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
