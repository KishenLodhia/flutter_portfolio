import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/utils/clipper.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          project.name,
          style: GoogleFonts.audiowide(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: TriangleClipper(),
                  child: SizedBox(
                      width: ScreenHelper.width(context),
                      height: 500,
                      child: Image.network(
                        project.image ?? '',
                        fit: BoxFit.cover,
                      )),
                ),
                // Positioned.fill(
                //   child: Opacity(
                //     opacity: 0.3,
                //     child: Container(
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: SizedBox(
                    width: ScreenHelper.width(context) * 0.6,
                    child: Text(
                      'Description\n${project.description ?? ''}',
                      softWrap: true,
                      style: GoogleFonts.audiowide(
                          fontSize: ScreenHelper.isMobile(context) ? 12 : 15,
                          color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.isMobile(context)
                      ? ScreenHelper.width(context) * 0.05
                      : ScreenHelper.width(context) * 0.15),
              child: Html(
                data: project.details,
                shrinkWrap: true,
                style: {
                  "*": Style(color: Colors.black),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
