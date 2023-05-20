import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

/// The details screen
class AchievementsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        optons: Options.even,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SideHeading(heading: 'Achievements'),
              Expanded(
                child: Container(
                  width: ScreenHelper.width(context) * 0.8,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Welcome to my portfolio! Here you will find a showcase of my skills, experience and "
                    "projects in the field of software engineering, along with my passion for"
                    "artificial intelligence, user interface and experience design. Feel free to explore and get in touch with "
                    "me to discuss any potential opportunities or collaborations.",
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
