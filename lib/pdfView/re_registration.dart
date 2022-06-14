import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class ReRegistration extends StatefulWidget {
  final File file;

  const ReRegistration({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _ReRegistrationState createState() => _ReRegistrationState();
}

class _ReRegistrationState extends State<ReRegistration> {
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