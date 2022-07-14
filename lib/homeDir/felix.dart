import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FelixPortal extends StatefulWidget {
  const FelixPortal({Key? key}) : super(key: key);

  @override
  _FelixPortalState createState() => _FelixPortalState();
}

class _FelixPortalState extends State<FelixPortal> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  @override
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
            navigationDelegate: (NavigationRequest request) {
              if (request.url.endsWith('.pdf')) {
                return  NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
              initialUrl: 'https://felix.hs-furtwangen.de/dmz/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }),
        ));
  }
}
