import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hfu_app2/pdfView/campus_furtwangen.dart';
import 'package:hfu_app2/pdfView/campus_tuttlingen.dart';
import 'package:hfu_app2/pdfView/campus_vs_schwenningen.dart';
import 'package:hfu_app2/pdfViewer.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standorte'),
      ),
      body: Container(
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
            ])),
        child: Container(
            child: Column(
          children: [
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: [
                    Text('Furtwangen'),
                    TextButton(
                        onPressed: () async {
                          final url = 'campuspläne/Furtwangen_Lageplan.pdf';
                          final file = await PDFViewer.loadFirebase(url);

                          if (file == null) return;
                          fuwaPDF(context, file);
                        },
                        child: const Text('Campusplan Furtwangen')),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () async {
                          final url = 'campuspläne/HFU_Campusplan_TUT.pdf';
                          final file = await PDFViewer.loadFirebase(url);

                          if (file == null) return;
                          tutPDF(context, file);
                        },
                        child: const Text('Campusplan Tuttlingen')),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () async {
                          final url = 'campuspläne/HFU_Campusplan_VS.pdf';
                          final file = await PDFViewer.loadFirebase(url);

                          if (file == null) return;
                          vsPDF(context, file);
                        },
                        child: const Text('Campusplan VS-Schwenningen')),
                  ],
                ),
              ),
            ),
          ],
         )
        ),
      ),
    );
  }

  void fuwaPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CampusFurtwangen(file: file)),
    );
  }

  void tutPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CampusTuttlingen(file: file)),
    );
  }

  void vsPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CampusSchwenningen(file: file)),
    );
  }
}
