import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExamsPlan extends StatefulWidget {
  const ExamsPlan({Key? key}) : super(key: key);

  @override
  _ExamsPlanState createState() => _ExamsPlanState();
}

class _ExamsPlanState extends State<ExamsPlan> {
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
            initialUrl: 'https://www.hs-furtwangen.de/studium/studienablauf/pruefungsplaene/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webController.complete(webViewController);
            }
        ),
      ),
    );
  }
}