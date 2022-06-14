import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class Beitragssatzung extends StatefulWidget {
  final File file;

  const Beitragssatzung({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _BeitragssatzungState createState() => _BeitragssatzungState();
}

class _BeitragssatzungState extends State<Beitragssatzung> {
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