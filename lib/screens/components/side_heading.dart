import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideHeading extends StatelessWidget {
  const SideHeading({
    super.key,
    required this.heading,
  });
  final String heading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RotatedBox(
        quarterTurns: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            heading,
            style: GoogleFonts.audiowide(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
