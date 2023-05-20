import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';

class Topic extends StatelessWidget {
  const Topic({super.key, required this.topic});
  final String topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            topic,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Divider(
            thickness: 0.2,
            height: 25,
            indent: ScreenHelper.width(context) * 0.4,
            endIndent: ScreenHelper.width(context) * 0.4,
          ),
        ],
      ),
    );
  }
}
