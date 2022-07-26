import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/faculties/facultyStructure.dart';

import '../faculties/faculty_webview.dart';

class FacultyWidget extends StatelessWidget {
  FacultyWidget({Key? key, required this.faculty}) : super(key: key);

  Faculty faculty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FacultyWebView(initialUrl: faculty.url)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: Image.asset(
            faculty.asset,
            fit: BoxFit.fitHeight,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: AutoSizeText(
              faculty.title,
              maxFontSize: 12,
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900, ),
            ),
          ),
        ),
      ),
    );
  }
}
