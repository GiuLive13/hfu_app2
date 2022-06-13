import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StudiPortal extends StatefulWidget {
  @override
  _StudiPortalState createState() => _StudiPortalState();
}

class _StudiPortalState extends State<StudiPortal> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
        decoration: BoxDecoration(
        color: Colors.lightGreen.shade400
    ),
    padding: EdgeInsets.only(top:24),
    child: WebView(
          initialUrl: 'https://studi-portal.hs-furtwangen.de/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    )
    );
  }
}