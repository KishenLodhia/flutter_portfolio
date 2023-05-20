import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final Animation<Offset> animation = Tween<Offset>(
    begin: const Offset(0, 0.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    const RiveAnimation.network(
                      'lib/assets/rive assets/test.riv',
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SlideTransition(
                        position: animation,
                        child: const IntroContent(),
                      ),
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
  const IntroContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.8
          : null,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MessageItem(message: 'Hi there!'),
          MessageItem(message: 'My name is Kishen Lodhia'),
          MessageItem(message: 'I am a Software Engineer'),
          MessageItem(
              message: 'Engineering the future\nOne line of code at a time'),
          MessageItem(
              message:
                  "Currently studying master's at \nQueensland University of Technology (Brisbane, AU)"),
          MessageItem(
            message:
                "Welcome to my portfolio! Here you will find a showcase of my skills, experience and \n"
                "projects in the field of software engineering, along with my passion for \n"
                "artificial intelligence, user interface and experience design. Feel free to explore and get in touch with \n"
                "me to discuss any potential opportunities or collaborations.",
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCaptionColor.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      duration: const Duration(seconds: 1),
      child: Text(message),
    );
  }
}

class MessageItem2 extends StatefulWidget {
  const MessageItem2({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<MessageItem2> createState() => _MessageItem2State();
}

class _MessageItem2State extends State<MessageItem2>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..resync(this);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kCaptionColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        child: Text(widget.message),
      ),
    );
  }
}
