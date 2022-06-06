import 'package:hfu_app2/websites/hfu_website_news.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

/*
    I-wie anders aufteilen
 */

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  List<EventArticle> eventArticles = [];

  @override
  void initState() {
    super.initState();

    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.hs-furtwangen.de/veranstaltungen/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('h2')
        .map((element) => element.innerHtml.trim())
        .toList();

    final events = html
        .querySelectorAll('span.c-filter-list__item__col.c-filter-list__item__col--span-4.js-filterable-list__item > a')
        .map((element) => '${element.attributes['title']}')
        .toList();

    final urls = html
        .querySelectorAll('a')
        .map((element) => 'https://www.hs-furtwangen.de/aktuelles/${element.attributes['href']}')
        .toList();

    print('Count: ${titles.length}');

    setState(() {
      eventArticles = List.generate(
        titles.length,
            (index) => EventArticle(
          title: titles[index],
          event: events[index],
          url: urls[index],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veranstaltungen'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: eventArticles.length,
        itemBuilder: (context, index) {
          final eventArticle = eventArticles[index];

          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    eventArticle.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                      eventArticle.event
                  ),
                ),
                ButtonBar(
                    children: [
                      IconButton(
                          onPressed: () {
                            //       Navigator.push(context, MaterialPageRoute(builder: (context) => HfuWebsiteNews()));
                          },
                          icon: Icon(Icons.arrow_forward_ios)
                      ),
                    ]
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EventArticle {
  final String event;
  final String title;
  final String url;

  const EventArticle({
    required this.event,
    required this.title,
    required this.url,
  });
}




