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
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: const Center(
          child: Text('Ansprechperson bei Problemen innerhalb der App'),
        ),
      ),
    );
  }
}
