import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class SemesterCalender extends StatefulWidget {
  final File file;

  const SemesterCalender({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _SemesterCalenderState createState() => _SemesterCalenderState();
}

class _SemesterCalenderState extends State<SemesterCalender> {
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