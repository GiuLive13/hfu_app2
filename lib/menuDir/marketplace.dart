import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/addEntry.dart';

class Marketplace extends StatelessWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Marktplatz'),
        ),
        floatingActionButton: FloatingActionButton(
            //heroTag
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddEntry())) //_addEntry,
            ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(children: const [
            Text('Alle Einträge aus der DB',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ]),
        ));
  }
}

/* void _addEntry(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddEntry())); // Umsetzen
} */
