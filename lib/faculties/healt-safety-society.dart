import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class HSS extends StatefulWidget {
  @override
  _HSSState createState() => _HSSState();
}

class _HSSState extends State<HSS> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Gesundheit, Sicherheit, Gesellschaft'),
      ),
      body: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/gesundheit-sicherheit-gesellschaft/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}