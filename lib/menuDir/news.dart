import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktuelles'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(children: const [
          Text('NEWS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ]),
      ),
    );
  }
}
