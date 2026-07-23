import 'package:crm_system/Pages/LoginPage.dart';
import 'package:crm_system/Pages/MainHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      title: "Vanta CRM System",
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainHome(), // ✅ Make sure this exists
      },
    );
  }
}
