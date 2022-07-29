import 'package:flutter/foundation.dart';
import 'package:hfu_app2/websites/web_view.dart';
import 'package:hfu_app2/widgets/appbar_widget.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


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

    if (kDebugMode) {
      print('Count: ${headline.length}');
    }

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
      appBar: CustomMainAppBar(pageTitle: 'Veranstaltungen',
      ),
      body: Stack(
        children: [
          const CustomBackground(),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 5/3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
              ),
              padding: const EdgeInsets.all(20),
              itemCount: eventMonths.length,
              itemBuilder: (context, index) {
                final eventMonth = eventMonths[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://www.hs-furtwangen.de/veranstaltungen/?tx_solr%5Bfilter%5D%5B0%5D=publishedBy%3ApressOffice')));
                  },
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      color: Colors.green.shade800,
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
        ],
      )
    );
  }
}

class EventMonth {
  final String headline;

  const EventMonth({
    required this.headline,
  });
}




