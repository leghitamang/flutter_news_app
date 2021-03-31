import 'package:flutter/material.dart';
import 'package:news_app/screens/main_page.dart';
import 'package:news_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-news',
      theme: AppTheme.lightTheme,
      home: MainPage(),
    );
  }
}
