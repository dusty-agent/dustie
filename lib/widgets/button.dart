import 'package:flutter/material.dart';
import '../theme/dustie_colors.dart';

class DustieButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const DustieButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: dustieColorSet['secondary'],
          shape: BoxShape.circle,
        ),

        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
