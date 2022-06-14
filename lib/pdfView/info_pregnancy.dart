import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class InfoPregnancy extends StatefulWidget {
  final File file;

  const InfoPregnancy({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _InfoPregnancyState createState() => _InfoPregnancyState();
}

class _InfoPregnancyState extends State<InfoPregnancy> {
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