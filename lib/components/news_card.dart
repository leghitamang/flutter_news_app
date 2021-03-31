import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/news_detail_page.dart';
import 'package:news_app/theme/theme.dart';

class NewsCard extends StatelessWidget {
  final Article news;
  NewsCard(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(news.url)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                imageUrl: news.urlToImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10),
            Text(
              news.title,
              style: AppTheme.h4Style,
            ),
            SizedBox(height: 5),
            Text(
              news.description,
              maxLines: 2,
              style: AppTheme.h5Style.copyWith(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
