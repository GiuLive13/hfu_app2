import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class MedLifeScience extends StatefulWidget {
  @override
  _MedLifeScienceState createState() => _MedLifeScienceState();
}

class _MedLifeScienceState extends State<MedLifeScience> {
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
        decoration: const BoxDecoration(
        color: Colors.white
    ),
    padding: const EdgeInsets.only(top:25),
    child: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/medical-and-life-sciences/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    )
    );
  }
}