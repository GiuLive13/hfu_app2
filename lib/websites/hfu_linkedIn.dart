import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkedInLink extends StatefulWidget {
  const LinkedInLink({Key? key}) : super(key: key);

  @override
  _LinkedInLinkState createState() => _LinkedInLinkState();
}

class _LinkedInLinkState extends State<LinkedInLink> {
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
            color: Colors.white
        ),
        padding: EdgeInsets.only(top:25),
        child: WebView(
            initialUrl: 'https://www.linkedin.com/school/hochschule-furtwangen-university/?originalSubdomain=de',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webController.complete(webViewController);
            }
        ),
      ),
    );
  }
}