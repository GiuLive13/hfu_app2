import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/marketplace/entry.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

import '../menuDir/marketplace.dart';
import '../widgets/appbar_widget.dart';

class EntryView extends StatelessWidget {
  EntryView(this.entry, {Key? key}) : super(key: key);
  Entry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomMainAppBar(
          pageTitle: entry.title,
        ),
        body: Stack(
          children: [
            const CustomBackground(),
            SizedBox(
              /// HERO TAG
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
                    FutureBuilder(
                      future: getImagePath(entry),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        return snapshot.hasData ?
                        Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data),
                                    fit: BoxFit.fitHeight)
                            )
                        ) : const Center(child: CircularProgressIndicator());
                      },

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15, left: 15, right: 15, bottom: 5),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.primary),
                         borderRadius: BorderRadius.circular(15),
                        ),
                        child: AutoSizeText(
                          entry.description,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
