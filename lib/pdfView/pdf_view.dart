import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

import '../widgets/appbar_widget.dart';

class DocumentViewer extends StatefulWidget {
  final File file;

  const DocumentViewer({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _DocumentViewerState createState() => _DocumentViewerState();
}

class _DocumentViewerState extends State<DocumentViewer> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
      appBar: CustomMainAppBar(pageTitle: name,),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}