import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
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
        decoration: BoxDecoration(
          color: Colors.green.shade400
        ),
        padding: const EdgeInsets.only(top:15),
        child: WebView(
              initialUrl: 'https://webmail.hs-furtwangen.de/',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }
          ),
      ),
    );
  }
}