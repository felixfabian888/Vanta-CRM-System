import 'package:flutter/material.dart';
import '../common/logo_widget.dart';
import 'login_form.dart';

class MobileLoginLayout extends StatelessWidget {
  final VoidCallback onLogin;
  final bool isLoading;

  const MobileLoginLayout({
    super.key,
    required this.onLogin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(size: 90),
              const SizedBox(height: 20),
              const Text(
                'Vanta',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 32),
              LoginForm(
                isWeb: false,
                onLogin: onLogin,
                isLoading: isLoading,
              ),
              const SizedBox(height: 24),
              Text(
                '© 2026 Your Company',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
