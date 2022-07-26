import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hfu_app2/pdfView/pdf_view.dart';
import 'package:hfu_app2/websites/web_view.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import '../pdfView/pdf_viewer.dart';
import '../widgets/appbar_widget.dart';

class DatesAndDeadlines extends StatefulWidget {
  const DatesAndDeadlines({Key? key}) : super(key: key);

  @override
  State<DatesAndDeadlines> createState() => _DatesAndDeadlinesState();
}

class _DatesAndDeadlinesState extends State<DatesAndDeadlines> {
  Future getWebsiteData() async {
    final url = Uri.parse(
        'https://www.hs-furtwangen.de/studium/studienablauf/termine-und-fristen-studium/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final semester = html
        .querySelectorAll('td:nth-child')
        .map((element) => element.innerHtml.trim())
        .toList();

    final lecture = html
        .querySelectorAll('tr:nth-child > td:nth-child')
        .map((element) => element.innerHtml.trim())
        .toList();

    final exams = html
        .querySelectorAll('tr:nth-child > td:nth-child')
        .map((element) => element.innerHtml.trim())
        .toList();

    final lecturefree = html
        .querySelectorAll('tr:nth-child() > td:nth-child() > p')
        .map((element) => element.innerHtml.trim())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(
        pageTitle: 'Termine und Fristen',
      ),
      body: Stack(
        children: [
         // const CustomBackground(),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () async {
                      const url =
                          'documents/dates_deadlines/Kalender_WiSe21-22-SoSe2022.pdf';
                      final file = await PDFViewer.loadFirebase(url);

                      if (file == null) return;
                      documentView(context, file);
                    },
                    child: const Text(
                      'Kalenderübersicht',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                        fontSize: 20
                      ),
                    )
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WebsiteView(
                                initialUrl: 'https://www.hs-furtwangen.de/studium/studienablauf/pruefungsplaene/'))
                        ),
                    child: const Text(
                      'Prüfungspläne',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20
                      ),
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, ),
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(width: 8, height: 40,),
                    Text('Semesterdaten', style: TextStyle(
                        fontSize: 25,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline

                    ),)
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(width: 5, height: 20,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Sommersemester 2022', style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('14.März - 01.Juli 2022', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Prüfungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('04.Juli - 22.Juli 2022', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungsfrei:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('19.April & 07.-11.Juni 2022', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                const Divider( thickness: 1, indent: 55, endIndent: 55,),
                Row(
                  children: const [
                    SizedBox(width: 5, height: 20,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Wintersemester 2022/23', style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('04.Okt. 22 - 27.Jan. 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Prüfungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('30.Jan. - 15.Feb. 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungsfrei:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('23.Dez. 22 - 07.Jan. 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                const Divider(thickness: 1, indent: 55, endIndent: 55,),
                Row(
                  children: const [
                    SizedBox(width: 5, height: 20,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Sommersemester 2023', style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('13.März - 30.Juni 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Prüfungen:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('03. - 21.Juli 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Vorlesungsfrei:', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('11. April & 30.Mai - 03.Juni 2023', style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void documentView(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DocumentViewer(file: file)));
  }
}
