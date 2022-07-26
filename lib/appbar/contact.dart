import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/background_widget.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(pageTitle: 'Kontakt',),
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
