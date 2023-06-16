import 'package:flutter/material.dart';

Widget titleGradient() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
