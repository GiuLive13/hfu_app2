import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MensaSchwenningen extends StatefulWidget {
  const MensaSchwenningen({Key? key}) : super(key: key);

  @override
  _MensaSchwenningenState createState() => _MensaSchwenningenState();
}

class _MensaSchwenningenState extends State<MensaSchwenningen> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(top: 25),
          child: WebView(
              initialUrl: 'https://www.swfr.de/essen-trinken/speiseplaene/mensa-schwenningen/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }),
        ));
  }
}
