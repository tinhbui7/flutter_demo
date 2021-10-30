import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/news/new_detail_state.dart';
import 'package:the_coffee_house/app/screens/news/news_detail_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    Key? key,
    required this.blogUrl,
    required this.header,
  }) : super(key: key);

  final String blogUrl;
  final String header;

  @override
  _NewsDetailScreenState createState() =>
      _NewsDetailScreenState(blogUrl, header);
}

class _NewsDetailScreenState
    extends BaseLayoutState<NewsDetailScreen, NewsDetailBloc, NewsDetailState> {
  _NewsDetailScreenState(this.blogUrl, this.header);

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;

  final String blogUrl;
  final String header;

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      header,
      style: theme.textTheme.subtitle2?.copyWith(fontSize: 17.0),
    );
  }

  @override
  List<Widget> buildHeaderActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 13),
        child: IconButton(
          icon: Image.asset(
            Assets.iconShare,
            width: 20,
          ),
          onPressed: () async {
            if (await canLaunch(blogUrl)) {
              await launch(blogUrl);
            } else {
              throw 'Could not launch $blogUrl';
            }
          },
        ),
      ),
    ];
  }

  @override
  Widget buildContent(BuildContext context) {
    return WebView(
      initialUrl: blogUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController = webViewController;
        _controller.complete(webViewController);
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');

        // Removes header and footer from page
        _webViewController
            .evaluateJavascript("javascript:(function() { " +
                "var head = document.getElementsByTagName('header')[0];" +
                "head.parentNode.removeChild(head);" +
                "var footer = document.getElementsByTagName('footer')[0];" +
                "footer.parentNode.removeChild(footer);" +
                "})()")
            .then((value) => debugPrint('Page finished loading Javascript'))
            .catchError((onError) => debugPrint('$onError'));
      },
    );
  }
}
