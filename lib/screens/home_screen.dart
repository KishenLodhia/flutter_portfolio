import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/utils/extensions.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'dart:core';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const SideHeading(
                heading: 'Home',
              ),
              Expanded(
                child: Stack(
                  children: [
                    const RiveAnimation.asset(
                      'lib/assets/rive assets/test.riv',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IntroContent(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroContent extends StatelessWidget {
  IntroContent({super.key});
  final List<String> texts = [
    'Hi there!',
    "Welcome to my portfolio!",
    'My name is Kishen Lodhia',
    'I am a Software Engineer',
    "Currently studying master's at Queensland University of Technology (Brisbane, AU)",
    "Here you will find a showcase of my skills, experience and projects in the field of software engineering,",
    "Feel free to explore and get in touch with me to discuss any potential opportunities or collaborations."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.8
          : MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: texts.mapIndexed((e, element) {
          return MessageItem(
            message: e,
            duration: element * 50,
          );
        }).toList(),
      ),
    );
  }
}

class MessageItem extends StatefulWidget {
  const MessageItem({
    super.key,
    required this.message,
    required this.duration,
  });

  final String message;
  final int duration;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 600 + widget.duration),
    vsync: this,
  )..forward();

  late final Animation<Offset> animation = Tween<Offset>(
    begin: Offset(0, (widget.duration / 120)),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: FocusableActionDetector(
        onShowHoverHighlight: (value) {
          setState(() {
            if (value) {
              isHovered = true;
            } else {
              isHovered = false;
            }
          });
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kCaptionColor.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 1),
          child: AnimatedDefaultTextStyle(
            style: isHovered
                ? GoogleFonts.roboto(fontSize: 16)
                : GoogleFonts.roboto(fontSize: 14),
            duration: const Duration(milliseconds: 200),
            child: Text(widget.message),
          ),
        ),
      ),
    );
  }
}
