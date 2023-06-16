import 'package:flutter/material.dart';

class Currently extends StatelessWidget {
  final String search;
  const Currently({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Currently${search.isEmpty ? '' : '\n$search'}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
