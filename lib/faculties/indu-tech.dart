import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class InduTech extends StatefulWidget {
  @override
  _InduTechState createState() => _InduTechState();
}

class _InduTechState extends State<InduTech> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Industrial Technologies'),
      ),
      body: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/industrial-technologies/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}