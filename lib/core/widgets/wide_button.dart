import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  const WideButton(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor});

  final Color color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(blurRadius: 20.0, offset: Offset(5, 5), color: Colors.black87)
          ],
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
