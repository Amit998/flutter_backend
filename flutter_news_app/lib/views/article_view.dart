import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;

  const ArticleView({Key key, @required this.url}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _complete = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.blue),
            ),
            Text("News")
          ],
        ),
        actions: [
          Container(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: Colors.blue,
                )),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: (WebViewController webViewController) {
            _complete.complete(webViewController);
          },
        ),
      ),
    );
  }
}
