import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import '../pdfView/semesterkalender.dart';
import '../pdf_viewer.dart';

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
      appBar: AppBar(
        title: const Text('Termine und Fristen'),
      ),
      body: Stack(
        children: [
          const CustomBackground(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextButton(
                onPressed: () async {
                  const url =
                      'documents/dates_deadlines/Kalender_WiSe21-22-SoSe2022.pdf';
                  final file = await PDFViewer.loadFirebase(url);

                  if (file == null) return;
                  semCalPDF(context, file);
                },
                child: const Text(
                  'Kalenderübersicht',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                    fontSize: 20
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 8),
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(width: 8, height: 40,),
                    Text('Semesterdaten', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),)
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(width: 5, height: 20,),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Semester', style: TextStyle(
                        fontSize: 18
                      ),),
                    ),
                  ],
                ),
                const Divider(color: Colors.black, thickness: 1, indent: 25, endIndent: 25,),
              ],
            ),
          ),

        ],
      ),
    );
  }
  void semCalPDF(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SemesterCalender(file: file)));
  }
}
