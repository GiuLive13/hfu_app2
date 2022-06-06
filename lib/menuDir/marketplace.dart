import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/marketplace/addEntry.dart';
import 'package:hfu_app2/marketplace/entry-view.dart';
import 'package:hfu_app2/marketplace/entry.dart';

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          //heroTag
          child: const Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEntry()))),
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
        child: StreamBuilder<List<Entry>>(
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
      ),
    );
  }
}

Stream<List<Entry>> readEntry() => FirebaseFirestore.instance
    .collection('entries')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());

Widget buildEntry(Entry entry) => Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(
              color: Colors.green,
            )),
        margin: const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.account_circle, size: 32),
              title: Text(
                entry.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(entry.userContact),
            ),
            Row(children: [
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  entry.description,
                  style: const TextStyle(
                      fontSize: 17, overflow: TextOverflow.ellipsis),
                ),
              ),
            ]),
            Container(
                height: 80,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/hfu_website_adaptive_fore.png')))),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _clickEntry,
                    child: const Text(
                      "Eintrag anschauen",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );

// Geht nicht
void _clickEntry(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EntryView()));
}
