import 'package:flutter/material.dart';
import 'package:save_me/app/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'කාමරේ',
      routerConfig: router, // ✅ Use GoRouter here
    );
  }
}
