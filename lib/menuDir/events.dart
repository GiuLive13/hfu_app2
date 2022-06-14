import 'package:hfu_app2/event_details.dart';
import 'package:hfu_app2/websites/hfu_website_news.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../websites/hfu_website_events.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  List<EventMonth> eventMonths = [];

  @override
  void initState() {
    super.initState();

    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.hs-furtwangen.de/veranstaltungen/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final headline = html
        .querySelectorAll('section > h2')
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

    print('Count: ${headline.length}');

    setState(() {
      eventMonths = List.generate(
        headline.length,
            (index) => EventMonth(
          headline: headline[index],
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
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.9,
                  1.3,
                ],
                colors: [
                  Colors.white,
                  Colors.lightGreen.shade600,
                  Colors.green.shade900,
                ]
            )
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          padding: const EdgeInsets.all(20),
          itemCount: eventMonths.length,
          itemBuilder: (context, index) {
            final eventMonth = eventMonths[index];

            return InkWell(
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetail()));
                Navigator.push(context, MaterialPageRoute(builder: (context) => HfuWebsiteEvents()));
              },
              child: SizedBox(
                height: 80,
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          eventMonth.headline,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EventMonth {
  final String headline;

  const EventMonth({
    required this.headline,
  });
}




