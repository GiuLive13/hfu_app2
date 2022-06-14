import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class SZRottweil extends StatefulWidget {
  final File file;

  const SZRottweil({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _SZRottweilState createState() => _SZRottweilState();
}

class _SZRottweilState extends State<SZRottweil> {
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