import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/achievement.dart';
import 'package:flutter_portfolio/screens/components/achievement_card.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = context.watch<List<Achievement>>();
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
                child: ListView.builder(
                  itemCount: data.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAlias,
                  itemBuilder: (BuildContext context, int index) {
                    return AchievementCard(achievement: data[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
