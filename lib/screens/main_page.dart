import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      floatingActionButton: _buildSearchBtn(),      
    );
  }

  Widget _buildSearchBtn() {
    return FloatingActionButton(
      child: Icon(Icons.search),
      onPressed: () {},
    );
  }
}
