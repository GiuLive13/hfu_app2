import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Reftreff extends StatefulWidget {
  const Reftreff({Key? key}) : super(key: key);

  @override
  _ReftreffState createState() => _ReftreffState();
}

class _ReftreffState extends State<Reftreff> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  @override
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
        decoration: const BoxDecoration(
        color: Colors.black87
    ),
    padding: const EdgeInsets.only(top:15),
      child: WebView(
          initialUrl: 'https://reftreff.hs-furtwangen.de/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    ),
    );
  }
}