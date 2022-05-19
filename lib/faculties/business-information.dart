import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class BusInfo extends StatefulWidget {
  @override
  _BusInfoState createState() => _BusInfoState();
}

class _BusInfoState extends State<BusInfo> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Wirtschaftsinformatik'),
      ),
      body: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/wirtschaftsinformatik/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}