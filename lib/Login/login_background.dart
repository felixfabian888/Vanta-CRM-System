import 'dart:ui';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  final bool isWeb;
  const LoginBackground({super.key, required this.isWeb});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF9FAFB), // Background: Off-White
            Color(0xFFFFFFFF), // Pure White
            Color(0xFFF3F4F6), // Light Grey
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Subtle decorative circles
          Positioned(
            top: isWeb ? -100 : -80,
            left: isWeb ? 100 : -80,
            child: _blurredCircle(250, const Color(0xFFE5E7EB)),
          ),
          Positioned(
            bottom: isWeb ? -120 : -100,
            right: isWeb ? 150 : -60,
            child: _blurredCircle(300, const Color(0xFFF3F4F6)),
          ),
        ],
      ),
    );
  }

  Widget _blurredCircle(double size, Color color) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
