import 'package:flutter/material.dart';

import '../theme/dustie_colors.dart';

class Bubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const Bubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      constraints: const BoxConstraints(maxWidth: 280),

      decoration: BoxDecoration(
        color: isUser ? dustieColorSet['primary'] : dustieColorSet['surface'],

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: dustieColorSet['border']!),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: isUser ? Colors.white : dustieColorSet['textPrimary'],

          fontSize: 15,
        ),
      ),
    );

    /// user bubble
    if (isUser) {
      return Align(alignment: Alignment.centerRight, child: bubble);
    }

    /// dustie bubble
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// avatar
        Container(
          width: 36,
          height: 36,

          margin: const EdgeInsets.only(right: 8, top: 2),

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dustieColorSet['memory'],
          ),

          child: Center(
            child: Image.asset(
              'assets/images/dustie-person.png',
              width: 24,
              height: 24,
            ),
          ),
        ),

        bubble,
      ],
    );
  }
}
