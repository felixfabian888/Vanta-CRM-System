import 'package:flutter/material.dart';
import '../common/logo_widget.dart';
import 'login_form.dart';

class WebLoginLayout extends StatelessWidget {
  final VoidCallback onLogin;
  final bool isLoading;

  const WebLoginLayout({
    super.key,
    required this.onLogin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoWidget(size: 110),
                  const SizedBox(height: 32),
                  const Text(
                    'Vanta',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                      letterSpacing: 1.5,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The modern CRM platform built for teams that move fast. Manage relationships, close deals, and grow your business.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildFeatureRow(Icons.auto_awesome, 'Smart lead tracking'),
                  const SizedBox(height: 12),
                  _buildFeatureRow(Icons.insights, 'Real-time analytics'),
                  const SizedBox(height: 12),
                  _buildFeatureRow(Icons.security, 'Enterprise-grade security'),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: LoginForm(
                isWeb: true,
                onLogin: onLogin,
                isLoading: isLoading,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.8)),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF424242)),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF424242),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
