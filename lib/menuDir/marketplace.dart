import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hfu_app2/marketplace/add_entry.dart';
import 'package:hfu_app2/marketplace/entry.dart';
import 'package:hfu_app2/marketplace/entry_view.dart';
import 'package:path/path.dart';

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
          appBar: AppBar(
            title: const Text('Marktplatz'),
          ),
          floatingActionButton: snapshot.hasData? FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const FaIcon(FontAwesomeIcons.plus, size: 28),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const AddEntry()))
          ) : null,
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
                    ])
            ),
            child: StreamBuilder<List<Entry>>(
                stream: readEntry(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Something went wrong! ${snapshot.error}')
                    );
                  } else if (snapshot.hasData) {
                    final entries = snapshot.data!;

                    return ListView(
                      children: entries.map((entry) => buildEntry(context, entry)).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        );
      }

    );
  }
}

Stream<List<Entry>> readEntry() => FirebaseFirestore.instance
    .collection('entries')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());

/*Stream<QuerySnapshot<Map<String, dynamic>>> readUser() =>
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('entries')
        .snapshots();
*/
Widget buildEntry(BuildContext context, Entry entry) => Center(
      child: Card( // Hero
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
                            'assets/images/hfu_website_adaptive_fore.png'))
                )
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

void _clickEntry(BuildContext context, Entry entry) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EntryView(entry)));
}
