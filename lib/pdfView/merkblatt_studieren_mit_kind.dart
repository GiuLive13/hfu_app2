import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class MerkblattPregnancy extends StatefulWidget {
  final File file;

  const MerkblattPregnancy({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _MerkblattPregnancyState createState() => _MerkblattPregnancyState();
}

class _MerkblattPregnancyState extends State<MerkblattPregnancy> {
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