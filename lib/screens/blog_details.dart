import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_portfolio/model/blog.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          blog.title,
          style: GoogleFonts.audiowide(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: ScreenHelper.width(context),
              height: ScreenHelper.isMobile(context) ? 200 : 500,
              child: Hero(
                transitionOnUserGestures: true,
                tag: blog.title,
                child: CachedNetworkImage(
                  imageUrl: blog.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.isMobile(context)
                      ? ScreenHelper.width(context) * 0.05
                      : ScreenHelper.width(context) * 0.15),
              child: Html(
                data: blog.content,
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
