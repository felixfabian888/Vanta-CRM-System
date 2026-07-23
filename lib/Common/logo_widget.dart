import 'dart:ui';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final String? assetPath; // Optional: pass 'assets/logo.png'

  const LogoWidget({
    super.key,
    required this.size,
    this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.4),
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Center(
            child: assetPath != null
                ? Image.asset(assetPath!, width: size * 0.6, height: size * 0.6)
                : const Icon(Icons.hub_outlined, color: Color(0xFF424242)),
          ),
        ),
      ),
    );
  }
}
