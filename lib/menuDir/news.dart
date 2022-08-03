import 'package:hfu_app2/websites/web_view.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../websites/hfu_website_news.dart';
import '../widgets/appbar_widget.dart';

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
 //   final urlDetail = Uri.parse('https://www.hs-furtwangen.de/aktuelles/detail/');
    final response = await http.get(url);
  //  final responseDetail = await http.get(urlDetail);
    dom.Document html = dom.Document.html(response.body);
  //  dom.Document htmlDetail = dom.Document.html(responseDetail.body);

    final titles = html
        .querySelectorAll('article > div > h3')
        .map((element) => element.innerHtml.trim())
        .toList();
    
    final subtitles = html
        .querySelectorAll('article > div > p')
        .map((element) => element.innerHtml.trim())
        .toList();
    
    final urls = html
        .querySelectorAll('#tx-solr-search > ul > li > a')
        .map((element) => '${element.attributes['href']}')
        .toList();
   // final urlsDetail = htmlDetail.querySelectorAll('div > div').map((element) => 'https://www.hs-furtwangen.de/aktuelles/detail/${element}').toList();

    setState(() {
      newsArticles = List.generate(
          titles.length,
              (index) => NewsArticle(
                title: titles[index],
                subtitle: subtitles[index],
                url: urls[index],
             //   urlDetail: urlsDetail[index]
              ),
        );
      });
    // setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(pageTitle: 'Aktuelles',),
      body: Stack(
        children: [
          const CustomBackground(),
          ListView.builder(
          padding: const EdgeInsets.only(top: 6, left: 25, right: 25),
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
                            onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HfuWebsiteNews(newsArticle.url))),
                            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                        ),
                      ]
                  ),
                ],
              ),
            );
          },
        ),]
      ),
    );
  }
}



class NewsArticle {
  final String subtitle;
  final String title;
  final String url;
 // final String urlDetail;

  const NewsArticle({
    required this.subtitle,
    required this.title,
    required this.url,
  //  required this.urlDetail,
  });
}


 

