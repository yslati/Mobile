import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Currently extends StatelessWidget {
  final String search;
  final bool displayGeo;
  final Position? position;
  final bool isLoading;
  const Currently({
    super.key,
    required this.search,
    required this.displayGeo,
    this.position,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                displayGeo == true
                    ? "Currently\n${position?.latitude ?? ''} / ${position?.longitude ?? ''}"
                    : "Currently\n $search",
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
