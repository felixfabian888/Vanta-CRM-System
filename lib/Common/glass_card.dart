import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.padding,
    required this.child,
    this.borderRadius = 16, // Slightly tighter radius for a cleaner look
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 8, sigmaY: 8), // Reduced blur for cleaner look
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7), // Much cleaner, less "blurry"
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: const Color(0xFFE5E7EB), // Very subtle light grey border
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF111827)
                    .withOpacity(0.04), // Very faint shadow
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
