import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/addEntry.dart';
import 'package:hfu_app2/entry.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marktplatz'),
      ),
      floatingActionButton: FloatingActionButton(
          //heroTag
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEntry())) //_addEntry,
          ),
      body: StreamBuilder<List<Entry>>(
          stream: readEntry(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final entries = snapshot.data!;

              return ListView(
                children: entries.map(buildEntry).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Stream<List<Entry>> readEntry() => FirebaseFirestore.instance
    .collection('entries')
    .snapshots()
    .map((snapshot) => snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());

// Customizen
Widget buildEntry(Entry entry) => ListTile(
      leading: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 44,
            maxWidth: 64,
            minHeight: 44,
            maxHeight: 64,
          ),
          child: Icon(Icons.accessibility_new)),
      title: Text(entry.title + ' von ' + entry.userContact),
      subtitle: Text(entry.description),
    );
