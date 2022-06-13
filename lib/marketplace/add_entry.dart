import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'entry.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

  class _AddEntryState extends State<AddEntry> {
  // List<File> _files = []; /// Für Multipicks
    final user = FirebaseAuth.instance.currentUser?.uid;
    PlatformFile? selectedFile;
    UploadTask? uploadTask;

    final titleController = TextEditingController();
    final userContactController = TextEditingController();
    final descriptionController = TextEditingController();
    
    Future chooseFile() async {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;

        setState(() { selectedFile = result.files.first;});
    }

    Future uploadFile() async {
      final path = 'userFiles/entryFiles/$user/${selectedFile!.name}';
      final chosenFile = File(selectedFile!.path!);

      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(chosenFile);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ich biete/ suche ... '),
        ),
        body: Hero(
          tag: 'AddEntry',
          child: ListView(
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
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, size: 25,),
               //   border: InputBorder.none,
                  hintText : FirebaseAuth.instance.currentUser?.email,
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
              const SizedBox(height: 14),
              Center(
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () => chooseFile(),
                      icon: const FaIcon(FontAwesomeIcons.images, size: 44)
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0, top: 20),
                      child: IconButton(
                          onPressed: () => chooseFile(),
                          icon: const FaIcon(FontAwesomeIcons.plus, size: 20,color: Colors.red,)
                      ),
                    )
                  ]
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedFile != null)
                      Row(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(selectedFile!.name),
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                  onPressed: () {
                    final entry = Entry(
                        title: titleController.text,
                        userContact: userContactController.text,
                        description: descriptionController.text,
                       // imageEntry:
                    );
                    createEntry(entry);
                    Navigator.pop(context);
                    uploadFile();
                  },
                  icon: const FaIcon(Icons.add, size: 25),
                  label: const Text('Angebot hochladen',
                  style: TextStyle(fontSize: 20),)
              ),
            ],
          ),
        ),
      );
    }

    Future createEntry(Entry entry) async {
      final marketEntry = FirebaseFirestore.instance.collection('entries').doc();
      final userEntry  = FirebaseFirestore.instance.collection('entries').doc(entry.id);
      entry.id = marketEntry.id;
      entry.uid = userEntry.id;

      final json = entry.toJson();
      await marketEntry.set(json);
    }
  }

