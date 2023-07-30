import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/splash_screen.dart';

class BaseApp extends StatelessWidget{

  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        useMaterial3: true,
        fontFamily: 'cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}