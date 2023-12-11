import 'package:flutter/material.dart';
import './utils/colors.dart';
import './screens/convo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Unit converter',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroudColor,
        useMaterial3: true,
      ),
      home: ConvoScreen(),
    );
  }
}

