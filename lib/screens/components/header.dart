import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/screens/components/logo.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double logoHeight = 50;
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
          Logo(
            pageController: widget.pageController,
          ),
          const Spacer(),
          if (!ScreenHelper.isMobile(context)) ...[
            Row(
              children: [
                FocusableActionDetector(
                  child: HeaderItem(
                    label: 'Home',
                    onTap: () {
                      widget.pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                  ),
                ),
                HeaderItem(
                  label: 'Projects',
                  onTap: () {
                    widget.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                HeaderItem(
                  label: 'Achievements',
                  onTap: () {
                    widget.pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
                HeaderItem(
                  label: 'Blog',
                  onTap: () {
                    widget.pageController.animateToPage(3,
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

class HeaderItem extends StatefulWidget {
  const HeaderItem({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  State<HeaderItem> createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (value) {
        setState(() {
          if (value) {
            isHovered = true;
          } else {
            isHovered = false;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: widget.onTap,
          child: AnimatedDefaultTextStyle(
            style: isHovered
                ? GoogleFonts.audiowide(color: Colors.blue, fontSize: 22)
                : GoogleFonts.audiowide(color: Colors.white, fontSize: 18),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutCirc,
            child: Text(
              widget.label,
            ),
          ),
        ),
      ),
    );
  }
}
