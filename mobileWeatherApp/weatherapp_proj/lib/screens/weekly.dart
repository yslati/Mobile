import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Weekly extends StatelessWidget {
  final String search;
  final bool displayGeo;
  final Position? position;
  const Weekly({
    super.key,
    required this.search,
    required this.displayGeo,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          displayGeo == true
              ? "Weekly\n${position?.latitude ?? ''} / ${position?.longitude ?? ''}"
              : "Weekly\n $search",
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
