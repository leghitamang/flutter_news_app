import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/category_chips.dart';
import 'package:news_app/components/news_card.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/theme/theme.dart';
import 'package:news_app/utils/api_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> latestNews;

  bool _loading;

  static const List<String> countries = [
    'United States',
    'China',
    'Australia',
    'Korea',
    'Japan'
  ];
  String countrySpinnerValue = countries[0];

  @override
  void initState() {
    _loading = true;
    getLatestNews();
    super.initState();
  }

  getLatestNews() async {
    ApiHandler apiHandler = ApiHandler();
    await apiHandler.getLastestNews();
    latestNews = apiHandler.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildCategoryChips(),
          //TODO: use future builder
          _loading
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                )
              : _buildNewsCards(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/564x/95/7a/20/957a2007febf528bb713a5ea8ad34815.jpg',
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      backgroundImage: imageProvider,
                    );
                  },
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 5),
                Text('Hi, Ashley', style: AppTheme.h3Style),
              ],
            ),
            _buildCountyDropdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountyDropdown() {
    return DropdownButton(
      value: countrySpinnerValue,
      items: countries.map((country) {
        return DropdownMenuItem(
          child: Text(
            country,
            overflow: TextOverflow.ellipsis,
          ),
          value: country,
        );
      }).toList(),
      onChanged: (selectedCountry) {
        setState(
          () {
            countrySpinnerValue = selectedCountry;
          },
        );
      },
    );
  }

  Widget _buildCategoryChips() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20, bottom: 10),
        height: 50,
        child: CategoryChips(),
      ),
    );
  }

  Widget _buildNewsCards() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsCard(latestNews[index]);
        },
        childCount: latestNews.length,
      ),
    );
  }
}
