import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/home_screen.dart';
import 'package:flutter_portfolio/screens/my_intro_screen.dart';
import 'package:flutter_portfolio/screens/portfolio_screen.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final destinations = const [HomeScreen(), MyIntroScreen(), PortfolioScreen()];
  int index = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            useIndicator: true,
            labelType: NavigationRailLabelType.all,
            leading: const SizedBox(height: 20),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_sharp),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_sharp),
                label: Text('My Intro'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.interests_sharp),
                label: Text('Portfolio'),
              )
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            minWidth: 100,
          ),
          const VerticalDivider(),
          Expanded(
            child: destinations[_selectedIndex],
          )
        ],
      ),
    );
  }
}
