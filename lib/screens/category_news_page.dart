import 'package:flutter/material.dart';
import 'package:news_app/components/custom_appbar.dart';
import 'package:news_app/components/news_card.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/utils/api_handler.dart';

class CategoryNewsPage extends StatefulWidget {
  final String category;
  CategoryNewsPage(this.category);
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<Article> categoryNews;
  bool _loading;
  @override
  void initState() {
    getCategoryNews();
    super.initState();
  }

  getCategoryNews() async {
    _loading = true;
    ApiHandler apiHandler = ApiHandler();
    await apiHandler.getNewsBasedOnCat(widget.category);
    categoryNews = apiHandler.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('${widget.category} News'),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                itemBuilder: (context, index) => NewsCard(categoryNews[index]),
                itemCount: categoryNews.length,
              ),
            ),
    );
  }
}
