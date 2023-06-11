import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/blog.dart';
import 'package:flutter_portfolio/screens/blog_details.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog});

  final Blog blog;

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
                    imageUrl: blog.image,
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
                    blog.title,
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
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BlogDetails(blog: blog),
                        ),
                      );
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
