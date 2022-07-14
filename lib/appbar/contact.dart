import 'package:flutter/material.dart';

import '../widgets/background_widget.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontakt'),
      ),
      body: Stack(
        children: const [
          CustomBackground(),
          Center(
            child: Text('Ansprechperson bei Problemen innerhalb der App'),
          ),
        ],
      )
    );
  }
}
