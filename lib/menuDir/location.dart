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
          children: [
            Row(
              children: const [
                Text("Furtwangen"),
              ],
            ),
            Row(
              children: const [
                Text("Villingen-Schwenningen"),
              ],
            ),
            Row(
              children: const [
                Text("Tuttlingen"),
              ],
            )
          ],
        ));
  }
}
