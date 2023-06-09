import 'package:calculator_proj/model/buttonItemModel.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final ButtonItemModel item;
  final isPortrait;
  final Function callback;

  const CalcButton({
    super.key,
    required this.item,
    required this.isPortrait,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        child: ElevatedButton(
            onPressed: () => callback(item.text),
            style: ElevatedButton.styleFrom(
                backgroundColor: item.fillColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: Text(
              item.text,
              style: TextStyle(
                  fontSize: isPortrait ? item.textSize : item.textSize - 5,
                  color: item.textColor),
            )),
      ),
    );
  }
}
