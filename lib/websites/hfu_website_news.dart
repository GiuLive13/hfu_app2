// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class HfuWebsiteNews extends StatefulWidget {
  HfuWebsiteNews(this.url, {Key? key}) : super(key: key);

  String url;

  @override
  _HfuWebsiteNewsState createState() => _HfuWebsiteNewsState();
}

class _HfuWebsiteNewsState extends State<HfuWebsiteNews> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();


  @override
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Aktuelles'),
      ),
      body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}