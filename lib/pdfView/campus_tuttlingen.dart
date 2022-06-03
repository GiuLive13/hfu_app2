import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class CampusTuttlingen extends StatefulWidget {
  final File file;

  const CampusTuttlingen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _CampusTuttlingenState createState() => _CampusTuttlingenState();
}

class _CampusTuttlingenState extends State<CampusTuttlingen> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}