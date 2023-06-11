import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/screens/blog_screen.dart';
import 'package:flutter_portfolio/screens/components/header.dart';
import 'package:flutter_portfolio/screens/achievements_screen.dart';
import 'package:flutter_portfolio/screens/components/logo.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/screens/projects_screen.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final screenList = const [
    HomeScreen(),
    ProjectsScreen(),
    AchievementsScreen(),
    BlogScreen()
  ];
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContrastColor,
      endDrawer: customDrawer(context),
      appBar: ScreenHelper.isMobile(context)
          ? AppBar(
              centerTitle: true,
              foregroundColor: kContrastColor,
              backgroundColor: kContrastColor,
              title: const Logo(),
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      body: Column(
        children: [
          if (!ScreenHelper.isMobile(context)) ...[
            Header(
              pageController: controller,
            ),
          ],
          Expanded(
            child: PageView(
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                scrollDirection: Axis.vertical,
                controller: controller,
                children: screenList),
          ),
        ],
      ),
    );
  }

  Widget customDrawer(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
      child: Drawer(
        child: Column(
          children: [
            drawerHeader(context, 'Welcome'),
            drawerListTile(context, 0, 'Home'),
            drawerListTile(context, 1, 'Projects'),
            drawerListTile(context, 2, 'Achievements'),
            drawerListTile(context, 3, 'Blogs'),
          ],
        ),
      ),
    );
  }

  Widget drawerHeader(BuildContext context, String title) {
    return DrawerHeader(
      curve: Curves.easeInOutCubic,
      padding: EdgeInsets.zero,
      child: Container(
        color: Colors.blue,
        child: Stack(
          fit: StackFit.passthrough,
          children: const [
            Center(
              child: Text('Welcome'),
            ),
            RiveAnimation.asset(
              'lib/assets/rive assets/test.riv',
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerListTile(BuildContext context, int goToPage, String title) {
    return ListTile(
      hoverColor: Colors.blue,
      title: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.black),
      ),
      onTap: () {
        moveToPage(context, goToPage);
      },
    );
  }

  void moveToPage(context, int pageNumber) {
    //from drawer only
    controller.animateToPage(pageNumber,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
