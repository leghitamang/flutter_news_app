import 'package:flutter/material.dart';
import 'package:news_app/screens/category_news_page.dart';
import 'package:news_app/theme/light_color.dart';
import 'package:news_app/theme/theme.dart';

class CategoryChips extends StatelessWidget {
  final categories = [
    'Business',
    'Entertainment',
    'Health',
    'Sports',
    'Science',
    'Technology',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryNewsPage(categories[index]),
                ),
              );
            },
            child: Chip(
              label: Text(
                categories[index],
                style: AppTheme.h6Style.copyWith(color: LightColor.lightGrey),
              ),
              backgroundColor: LightColor.skyBlue,
            ),
          ),
        );
      },
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
