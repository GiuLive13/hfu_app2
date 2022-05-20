import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Aview extends StatefulWidget {
  @override
  _AviewState createState() => _AviewState();
}

class _AviewState extends State<Aview> {
  final Completer<WebViewController> _webController =
      Completer<WebViewController>();

  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(top: 25),
          child: WebView(
              initialUrl: 'https://howto.hs-furtwangen.de/aview/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }),
        ));
  }
}
