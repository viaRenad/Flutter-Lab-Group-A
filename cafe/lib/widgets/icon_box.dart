import 'package:flutter/material.dart';

// A compact container that consistently wraps an icon with padding and rounded corners.
class IconBox extends StatelessWidget {
  // The icon to display inside the box.
  final IconData icon;

  const IconBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // Uniform padding around the icon
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ), // Rounded corners for the container
      ),
      child: Icon(
        icon, // Display the provided icon
        color: const Color(0xFFD17B46), // Accent color matching theme
        size: 28.5, // Standard size for consistency
      ),
    );
  }
}
