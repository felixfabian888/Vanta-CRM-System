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
            Color(0xFFD6D6D6),
            Color(0xFFF5F5F5),
            Color(0xFFFFFFFF),
            Color(0xFFE8E8E8),
          ],
          stops: [0.0, 0.4, 0.7, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: isWeb ? -100 : -80,
            left: isWeb ? 100 : -80,
            child: _blurredCircle(250, const Color(0xFFBDBDBD)),
          ),
          Positioned(
            bottom: isWeb ? -120 : -100,
            right: isWeb ? 150 : -60,
            child: _blurredCircle(300, const Color(0xFFE0E0E0)),
          ),
          if (isWeb)
            Positioned(
              top: 200,
              right: 300,
              child: _blurredCircle(180, const Color(0xFF9E9E9E)),
            ),
        ],
      ),
    );
  }

  Widget _blurredCircle(double size, Color color) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
