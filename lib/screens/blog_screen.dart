import 'package:flutter/material.dart';
import 'package:flutter_portfolio/screens/components/background.dart';
import 'package:flutter_portfolio/screens/components/custom_card.dart';
import 'package:flutter_portfolio/screens/components/side_heading.dart';
import 'package:flutter_portfolio/utils/constants.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        optons: Options.odd,
        child: Center(
          child: Row(
            children: [
              const SideHeading(heading: 'Blog'),
              Expanded(
                child: Wrap(
                  clipBehavior: Clip.hardEdge,
                  spacing: 10,
                  runSpacing: 10,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                    CustomCard(
                      heading: 'AI Based Project on Vercel with ML and AI',
                      subheading: 'New project',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
