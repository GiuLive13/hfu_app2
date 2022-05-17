import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'entry.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

  class _AddEntryState extends State<AddEntry> {
    final titleController = TextEditingController();
    final userContactController = TextEditingController();
    final descriptionController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ich biete ... '),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
             TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                //  border: InputBorder.none,
                  hintText: 'Titel',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 10),
             TextFormField(
              controller: userContactController,
              decoration: const InputDecoration(
             //   border: InputBorder.none,
                hintText: 'Kontaktdaten',
              ),
            ),
            const SizedBox(height: 10),
             TextField(
               maxLines: 5,
              minLines: 1,
              controller: descriptionController,
              decoration: const InputDecoration(
                fillColor: Colors.white54 ,
            //    border: InputBorder.none,
                hintText: 'Beschreibung',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
                onPressed: () {
                  final entry = Entry(
                      title: titleController.text,
                      userContact: userContactController.text,
                      description: descriptionController.text,
                  );
                  createEntry(entry);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add, size: 25),
                label: const Text('Angebot hochladen',
                style: TextStyle(fontSize: 20),)
            ),
          ],
        ),
      );
    }

    Future createEntry(Entry entry) async {
      final marketEntry = FirebaseFirestore.instance.collection('entries').doc();
      entry.id = marketEntry.id;

      final json = entry.toJson();
      await marketEntry.set(json);
    }
  }

