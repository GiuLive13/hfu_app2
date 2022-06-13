import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DatesAndDeadlines extends StatefulWidget {
  const DatesAndDeadlines({Key? key}) : super(key: key);

  @override
  State<DatesAndDeadlines> createState() => _DatesAndDeadlinesState();
}

class _DatesAndDeadlinesState extends State<DatesAndDeadlines> {

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.hs-furtwangen.de/studium/studienablauf/termine-und-fristen-studium/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termine und Fristen'),
      ),
    );
  }
}