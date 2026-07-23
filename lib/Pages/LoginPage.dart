import 'package:flutter/material.dart';
import '../Login/login_background.dart';
import '../Login/mobile_login_layout.dart';
import '../Login/web_login_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _login() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      // TODO: Navigate to home
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWeb = constraints.maxWidth > 800;
          return Stack(
            children: [
              LoginBackground(isWeb: isWeb),
              isWeb
                  ? WebLoginLayout(onLogin: _login, isLoading: _isLoading)
                  : MobileLoginLayout(onLogin: _login, isLoading: _isLoading),
            ],
          );
        },
      ),
    );
  }
}
