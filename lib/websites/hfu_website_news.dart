import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class HfuWebsiteNews extends StatefulWidget {
  @override
  _HfuWebsiteNewsState createState() => _HfuWebsiteNewsState();
}

class _HfuWebsiteNewsState extends State<HfuWebsiteNews> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

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
          initialUrl: 'https://www.hs-furtwangen.de/aktuelles/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}