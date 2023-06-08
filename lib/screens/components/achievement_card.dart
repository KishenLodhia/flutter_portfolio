import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/achievement.dart';
import 'package:flutter_portfolio/screens/components/achievement_modal_dialog.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      color: const Color.fromRGBO(2, 77, 139, 1),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: achievement.image,
                    fit: BoxFit.cover,
                  )),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    achievement.title,
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
                  child: ElevatedButton(
                    onPressed: () async {
                      if (ScreenHelper.isMobile(context)) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      achievement.description,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AchievementModalDialog(
                                  achievement: achievement);
                            });
                      }
                    },
                    child: const Text('Quick Glance'),
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
