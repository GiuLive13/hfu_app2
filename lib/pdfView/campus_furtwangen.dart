import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';



class CampusFurtwangen extends StatefulWidget {
  final File file;

  const CampusFurtwangen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _CampusFurtwangenState createState() => _CampusFurtwangenState();
}

class _CampusFurtwangenState extends State<CampusFurtwangen> {
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