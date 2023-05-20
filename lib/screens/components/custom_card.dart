import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.heading, this.subheading, this.onTap});

  final String heading;
  final String? subheading;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      color: const Color.fromRGBO(2, 77, 139, 1),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 250,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  'data:image/jpeg;base64,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',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  heading,
                  style: GoogleFonts.audiowide(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
                    onPressed: onTap,
                    child: const Text('View more'),
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
