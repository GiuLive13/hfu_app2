import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hfu_app2/marketplace/add_entry.dart';
import 'package:hfu_app2/marketplace/entry.dart';
import 'package:hfu_app2/marketplace/entry_view.dart';
import 'package:hfu_app2/widgets/appbar_widget.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: CustomMainAppBar(
              pageTitle: 'Marktplatz',
            ),
            floatingActionButton: snapshot.hasData
                ? FloatingActionButton(
                    child: const FaIcon(FontAwesomeIcons.plus, size: 28),
                    mini: true,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddEntry())))
                : null,
            body: Stack(children: [
              const CustomBackground(),
              StreamBuilder<List<Entry>>(
                  stream: readEntry(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child:
                              Text('Something went wrong! ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final entries = snapshot.data!;

                      return ListView(
                        children: entries
                            .map((entry) => buildEntry(context, entry))
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ]),
          );
        });
  }
}

Stream<List<Entry>> readEntry() => FirebaseFirestore.instance
    .collection('entries')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());

Future<String> getImagePath(Entry entry) async {
  final ref = FirebaseStorage.instance
      .ref()
      .child('userFiles')
      .child('entryFiles')
      .child(entry.uid)
      .child(entry.imagePath);
  var url = await ref.getDownloadURL();
  return url;
}

Widget buildEntry(BuildContext context, Entry entry) => Center(
      child: Card(
        /// HERO TAG
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: const BorderSide(
              color: Colors.green,
            )),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  child: FutureBuilder(
                    future: getUserProfileImagePath(entry),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return snapshot.hasData
                          ? CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.transparent,
                              backgroundImage: CachedNetworkImageProvider(
                                snapshot.data ?? '',
                              ))
                          : const Center(child: CircularProgressIndicator());
                    },
                  )),
              title: Text(
                entry.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(entry.userContact),
            ),
            const SizedBox(
              width: 30,
            ),
            FutureBuilder(
              future: getImagePath(entry),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.hasData
                    ? Container(
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data),
                                fit: BoxFit.fitHeight)))
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => _clickEntry(context, entry),
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

Future<String> getUserProfileImagePath(Entry entry) async {
  final ref = FirebaseStorage.instance
      .ref()
      .child('userFiles')
      .child('profileImages')
      .child(entry.uid)
      .child('profilepicture');
  var url = await ref.getDownloadURL();
  return url;
}

void _clickEntry(BuildContext context, Entry entry) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EntryView(entry)));
}
