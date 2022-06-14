import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/marketplace/entry.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

class EntryView extends StatelessWidget {
  EntryView(this.entry, {Key? key}) : super(key: key);
  Entry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marktplatz'),
      ),
      body: Stack(
        children: [
          const CustomBackground(),
          Hero(
            tag: 'AddEntry',
            child: SizedBox(
              height: 540,
              child: Card(
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
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/hfu_website_adaptive_fore.png'))
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
                      child: Expanded(
                        child: Text(
                          entry.description,
                          style: const TextStyle(
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
