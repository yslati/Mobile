import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Color fillColor;
  final Color textColor;
  final Function callback;

  const CalcButton({
    super.key,
    required this.text,
    required this.textSize,
    required this.fillColor,
    required this.textColor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 68,
        height: 68,
        child: ElevatedButton(
            onPressed: () => callback(text),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(5),
                backgroundColor: fillColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35))),
            child: Text(
              text,
              style: TextStyle(fontSize: textSize, color: textColor),
            )),
      ),
    );
  }
}
