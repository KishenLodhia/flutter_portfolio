import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/project_card.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = context.watch<List<Project>>();
    return Scaffold(
      body: Background(
        optons: Options.odd,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SideHeading(heading: 'Projects'),
              Expanded(
                child: GridView.builder(
                  itemCount: data.length,
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectCard(project: data[index]);
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
