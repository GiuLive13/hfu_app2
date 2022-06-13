import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class EventDetail extends StatefulWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {

  @override
  void initState() {
    super.initState();

    getWebsiteData();
  }
  void getWebsiteData() async {
    final url = Uri.parse('https://www.hs-furtwangen.de/veranstaltungen/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    
    final event = html
        .querySelectorAll('section:nth-child(1) > ul > li.c-filter-list__item.u-hide-on-mobile > span.c-filter-list__item__col.c-filter-list__item__col--span-4.u-h4')
        .map((element) => element.innerHtml.trim())
        .toList();
    
    final date = html
        .querySelectorAll('span:nth-child(2)')
        .map((element) => element.innerHtml.trim())
        .toList();

    final located = html
        .querySelectorAll('span:nth-child(3)')
        .map((element) => element.innerHtml.trim())
        .toList();

    setState((){

    });
  }


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class EventDetails {
  final String event;
  final String date;
  final String located;

  const EventDetails({
    required this.event,
    required this.date,
    required this.located,
  });
}



