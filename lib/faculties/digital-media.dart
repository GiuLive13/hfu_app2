import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class DigitalMedia extends StatefulWidget {
  const DigitalMedia({Key? key}) : super(key: key);

  @override
  _DigitalMediaState createState() => _DigitalMediaState();
}

class _DigitalMediaState extends State<DigitalMedia> {
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
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/digitale-medien/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    )
    );
  }
}