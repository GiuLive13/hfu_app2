import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';


class HfuWebsiteEvents extends StatefulWidget {
  @override
  _HfuWebsiteEventsState createState() => _HfuWebsiteEventsState();
}

class _HfuWebsiteEventsState extends State<HfuWebsiteEvents> {
  final Completer<WebViewController> _webController = Completer<WebViewController>();

  @override
  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Veranstaltungen'),
      ),
      body: WebView(
          initialUrl: 'https://www.hs-furtwangen.de/veranstaltungen/?tx_solr%5Bfilter%5D%5B0%5D=publishedBy%3ApressOffice',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webController.complete(webViewController);
          }
      ),
    );
  }
}