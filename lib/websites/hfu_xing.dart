import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class XingLink extends StatefulWidget {
  const XingLink({Key? key}) : super(key: key);

  @override
  _XingLinkState createState() => _XingLinkState();
}

class _XingLinkState extends State<XingLink> {
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
            initialUrl: 'https://www.xing.com/pages/hochschulefurtwangenuniversity',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webController.complete(webViewController);
            }
        ),
      ),
    );
  }
}