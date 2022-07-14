import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HfuWebsite extends StatefulWidget {
  const HfuWebsite({Key? key}) : super(key: key);

  @override
  _HfuWebsiteState createState() => _HfuWebsiteState();
}

class _HfuWebsiteState extends State<HfuWebsite> {
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
        title: const Text ('Website'),
      ),
      body: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}