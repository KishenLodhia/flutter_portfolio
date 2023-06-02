import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/admin_screens/achievements_screen.dart';
import 'package:flutter_portfolio/screens/admin_screens/projects_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  var _index = 0;
  List<Widget> screens = const [
    AdminProjectScreen(),
    AdminAchievementsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Welcome, ${FirebaseAuth.instance.currentUser?.email}',
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            indicatorColor: Colors.grey,
            backgroundColor: Colors.black,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (value) {
              setState(() {
                _index = value;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark),
                label: Text('Projects'),
              )
            ],
            selectedIndex: _index,
          ),
          const VerticalDivider(
            thickness: 0.1,
            color: Colors.white,
          ),
          Expanded(
            child: screens[_index],
          ),
        ],
      ),
    );
  }
}
