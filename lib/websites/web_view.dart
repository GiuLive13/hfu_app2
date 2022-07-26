import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class WebsiteView extends StatefulWidget {
  WebsiteView({Key? key, required this.initialUrl}) : super(key: key);

  String initialUrl;

  @override
  _WebsiteViewState createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
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
              navigationDelegate: (NavigationRequest request) {
                if (request.url.endsWith('.pdf')) {
                  return  NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
              initialUrl: widget.initialUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _webController.complete(webViewController);
              }
          ),
        )
    );
  }
}