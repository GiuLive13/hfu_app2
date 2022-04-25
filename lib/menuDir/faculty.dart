import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Faculty extends StatelessWidget {
  const Faculty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fakultäten'),
      ),
      body: const Center(
        child: SizedBox(
          height: 50,
          width: 100,
          child: Text('Fakultäten mit Kontaktadressen',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
