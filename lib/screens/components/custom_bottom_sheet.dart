import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Row(
        children: [
          if (!ScreenHelper.isMobile(context)) ...[
            SizedBox(
              width: ScreenHelper.width(context) / 2,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: project.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    'Description\n${project.description ?? ''}',
                    softWrap: true,
                    style: GoogleFonts.audiowide(
                        fontSize: ScreenHelper.isMobile(context) ? 12 : 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
