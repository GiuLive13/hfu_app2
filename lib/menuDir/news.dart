import 'package:hfu_app2/websites/hfu_website_news.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<NewsArticle> newsArticles = [];

  @override
  void initState() {
    super.initState();
    
    getWebsiteData();
  }
  
  Future getWebsiteData() async {
    final url = Uri.parse('https://www.hs-furtwangen.de/aktuelles/?tx_solr%5Bfilter%5D%5B0%5D=publishedBy%3ApressOffice');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll('article > div > h3')
        .map((element) => element.innerHtml.trim())
        .toList();
    
    final subtitles = html
        .querySelectorAll('a > article > div > p')
        .map((element) => element.innerHtml.trim())
        .toList();
    
    final urls = html
        .querySelectorAll('a')
        .map((element) => 'https://www.hs-furtwangen.de/aktuelles/${element.attributes['href']}')
        .toList();

    setState(() {
      newsArticles = List.generate(
          titles.length,
              (index) => NewsArticle(
                title: titles[index],
                subtitle: subtitles[index],
                url: urls[index],
              ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktuelles'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: newsArticles.length,
          itemBuilder: (context, index) {
            final newsArticle = newsArticles[index];

            return Card(
              color: Colors.green.shade800,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        newsArticle.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    subtitle: Text(
                        newsArticle.subtitle,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: [
                      IconButton(
                          onPressed: () {
                     //       Navigator.push(context, MaterialPageRoute(builder: (context) => HfuWebsiteNews()));
                          },
                          icon: const Icon(Icons.arrow_forward_ios)
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

class NewsArticle {
  final String subtitle;
  final String title;
  final String url;

  const NewsArticle({
    required this.subtitle,
    required this.title,
    required this.url,
  });
}


 

