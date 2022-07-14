import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class BusAdmin extends StatefulWidget {
  const BusAdmin({Key? key}) : super(key: key);

  @override
  _BusAdminState createState() => _BusAdminState();
}

class _BusAdminState extends State<BusAdmin> {
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
          initialUrl: 'https://www.hs-furtwangen.de/fakultaeten/wirtschaftsingenieurwesen/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    )
    );
  }
}