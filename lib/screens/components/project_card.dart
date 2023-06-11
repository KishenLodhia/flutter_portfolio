import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/screens/components/custom_bottom_sheet.dart';
import 'package:flutter_portfolio/screens/project_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      color: const Color.fromRGBO(2, 77, 139, 1),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 250,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: SizedBox(
                  width: double.infinity,
                  child: Hero(
                    tag: project.name,
                    child: CachedNetworkImage(
                      imageUrl: project.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    project.name,
                    style: GoogleFonts.audiowide(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              clipBehavior: Clip.antiAlias,
                              context: context,
                              builder: (context) {
                                return CustomBottomSheet(project: project);
                              });
                        },
                        child: const Text('Quick Glance'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  ProjectDetails(project: project),
                            ),
                          );
                        },
                        child: const Text('View more'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
