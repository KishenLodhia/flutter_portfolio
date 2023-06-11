import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
    this.pageController,
  });
  final PageController? pageController;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  double logoHeight = 50;
  @override
  Widget build(BuildContext context) {
    if (ScreenHelper.isMobile(context)) {
      return IconButton(
          onPressed: () {},
          icon: SizedBox(
            height: 30,
            child: Image.asset(
              'lib/assets/images/logo_lq.png',
              filterQuality: FilterQuality.high,
            ),
          ));
    }
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      onEnter: (event) {
        setState(() {
          logoHeight = 65;
        });
      },
      onExit: (event) {
        setState(() {
          logoHeight = 50;
        });
      },
      child: AnimatedContainer(
        height: logoHeight,
        curve: Curves.easeInOutCirc,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () {
            if (widget.pageController != null) {
              widget.pageController?.animateToPage(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            }
          },
          child: Image.asset(
            'lib/assets/images/logo_lq.png',
          ),
        ),
      ),
    );
  }
}
