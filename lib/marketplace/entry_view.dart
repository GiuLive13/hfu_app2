import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/marketplace/entry.dart';

class EntryView extends StatelessWidget {
  EntryView(this.entry, {Key? key}) : super(key: key);
  Entry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marktplatz'),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                    0.1,
                    0.9,
                    1.3,
                  ],
                  colors: [
                    Colors.white,
                    Colors.lightGreen.shade600,
                    Colors.green.shade900,
                  ])),
          child: Text(entry.title)
      ),
    );
  }
}
