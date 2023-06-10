import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/achievement.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementModalDialog extends StatelessWidget {
  const AchievementModalDialog({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      content: Container(
        height: 500,
        width: ScreenHelper.width(context) * 0.8,
        margin: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InteractiveViewer(
                  child: Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(achievement.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 500,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        achievement.description,
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
