import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MensaFurtwangen extends StatefulWidget {
  const MensaFurtwangen({Key? key}) : super(key: key);

  @override
  _MensaFurtwangenState createState() => _MensaFurtwangenState();
}

class _MensaFurtwangenState extends State<MensaFurtwangen> {
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
              initialUrl: 'https://www.swfr.de/essen-trinken/speiseplaene/mensa-furtwangen/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }),
        ));
  }
}
