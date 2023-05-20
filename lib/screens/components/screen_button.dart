import 'package:flutter/material.dart';

class ScreenButton extends StatelessWidget {
  const ScreenButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 80,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
