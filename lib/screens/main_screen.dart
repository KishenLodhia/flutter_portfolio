import 'package:flutter/material.dart';
import 'package:flutter_portfolio/globals.dart';
import 'package:flutter_portfolio/screens/blog_screen.dart';
import 'package:flutter_portfolio/screens/components/header.dart';
import 'package:flutter_portfolio/screens/achievements_screen.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/screens/projects_screen.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';

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
      endDrawer: const Drawer(),
      appBar: ScreenHelper.isMobile(context)
          ? AppBar(
              foregroundColor: kContrastColor,
              backgroundColor: kContrastColor,
              title: const Logo(),
            )
          : null,
      body: Column(
        children: [
          if (ScreenHelper.isTablet(context) ||
              ScreenHelper.isDesktop(context)) ...[
            Header(
              pageController: controller,
            ),
          ],
          Expanded(
            child: PageView(
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                controller: controller,
                children: screenList),
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          DrawerHeader(
            child: Placeholder(),
          ),
          ListTile()
        ],
      ),
    );
  }
}
