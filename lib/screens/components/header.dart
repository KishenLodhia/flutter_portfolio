import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kContrastColor,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Logo(),
          const Spacer(),
          if (!ScreenHelper.isMobile(context)) ...[
            Row(
              children: [
                HeaderItem(
                  label: 'Home',
                  onTap: () {
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                HeaderItem(
                  label: 'Projects',
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                HeaderItem(
                  label: 'Achievements',
                  onTap: () {
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                HeaderItem(
                  label: 'Blog',
                  onTap: () {
                    pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
              ],
            ),
          ] else ...[
            IconButton(onPressed: () {}, icon: const Icon(Icons.draw_rounded))
          ]
        ],
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  const HeaderItem({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.audiowide(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "K",
            style: GoogleFonts.oswald(
              color: kAccentColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "L.",
            style: GoogleFonts.oswald(
              color: kCaptionColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
