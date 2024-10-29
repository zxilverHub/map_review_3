import 'package:flutter/material.dart';
import 'package:midterm_review_2/screens/midterm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Midterm(),
    );
  }
}
