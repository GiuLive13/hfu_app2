import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class CampusSchwenningen extends StatefulWidget {
  final File file;

  const CampusSchwenningen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _CampusSchwenningenState createState() => _CampusSchwenningenState();
}

class _CampusSchwenningenState extends State<CampusSchwenningen> {
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