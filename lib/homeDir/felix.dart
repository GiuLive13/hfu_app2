import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FelixPortal extends StatefulWidget {
  @override
  _FelixPortalState createState() => _FelixPortalState();
}

class _FelixPortalState extends State<FelixPortal> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('FELIX'),
      ),
      body: WebView(
          initialUrl: 'https://felix.hs-furtwangen.de/dmz/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}

