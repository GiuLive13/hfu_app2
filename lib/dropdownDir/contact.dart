import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt'),
      ),
      body: const Center(
        child: Text('Ansprechperson bei Problemen innerhalb der App'),
      ),
    );
  }
}
