import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/components/custom_appbar.dart';
import 'package:news_app/theme/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final String newsUrl;
  DetailPage(this.newsUrl);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('News in WebView'),
      body: Container(
        height: AppTheme.fullHeight(context),
        width: AppTheme.fullWidth(context),
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
