import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Twitter extends StatefulWidget {
  const Twitter({Key? key}) : super(key: key);

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
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
            color: Colors.white
        ),
        padding: const EdgeInsets.only(top:25),
        child: WebView(
            initialUrl: 'https://twitter.com/hs_furtwangen?lang=de',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webController.complete(webViewController);
            }
        ),
      ),
    );
  }
}