import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/blog.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/blog_card.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = context.watch<List<Blog>>();
    return Scaffold(
      body: Background(
        optons: Options.odd,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SideHeading(heading: 'Blogs'),
              Expanded(
                child: GridView.builder(
                  primary: false,
                  itemCount: data.length,
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (BuildContext context, int index) {
                    return BlogCard(blog: data[index]);
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
