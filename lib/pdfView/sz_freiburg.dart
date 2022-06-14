import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class SZFreiburg extends StatefulWidget {
  final File file;

  const SZFreiburg({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _SZFreiburgState createState() => _SZFreiburgState();
}

class _SZFreiburgState extends State<SZFreiburg> {
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