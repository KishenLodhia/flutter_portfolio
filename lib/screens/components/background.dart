import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/constants.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.child, required this.optons});

  final Widget? child;
  final Options optons;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add box decoration

      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin:
              optons == Options.even ? Alignment.bottomLeft : Alignment.topLeft,
          end: optons == Options.even
              ? Alignment.topRight
              : Alignment.bottomRight,

          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: const [0.1, 0.5, 0.7, 0.9],
          colors: [
            const Color.fromARGB(255, 9, 52, 94),
            Colors.blue.shade900,
            Colors.blue.shade700,
            Colors.blue.shade400,
          ],
        ),
      ),
      child: child,
    );
  }
}
