import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Standorte'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: const [
                Text("Furtwangen"),
                SizedBox(height: 30),
              ],
            ),
            Row(
              children: [
                Card(
                  elevation: 4.0,
                  child: Text("Adresse: "),
                )
              ],
            ),
            Row(
              children: const [
                Text("Tuttlingen"),
                SizedBox(height: 30),
              ],
            ),
            Row(children: [
              Card(
                elevation: 4.0,
                child: Text("Adresse: "),
              ),
            ]),
            Row(
              children: const [
                Text("Villingen-Schwenningen"),
                SizedBox(height: 30),
              ],
            ),
            Row(children: [
              Card(
                elevation: 4.0,
                child: Text("Adresse: "),
              ),
            ])
          ],
        )
    );
  }
}
