import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'entry.dart';

class AddEntry extends StatelessWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ich biete ... '),
        ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
          ),
          SizedBox(height: 10),
          TextField(
          ),
          SizedBox(height: 10),
          TextField(
          ),
        ],
    ),


    );
  }
    Future createEntry({
      required String title, required String userContact, required String description
    }) async {
      final marketEntry = FirebaseFirestore.instance.collection('Marktplatz').doc();

      final entry = Entry(
          id: marketEntry.id,
          title: title,
          userContact: userContact,
          description: description,
      );
   /*   final json = entry.toJson();

      await marketEntry.set(json); */

    /*  Map<String, dynamic> toJson() {
        'id': id,
        'Titel': title,
        'Kontaktdaten': userContact,
        'Beschreibung': description,
      }; */
  }

}
