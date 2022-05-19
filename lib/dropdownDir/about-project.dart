import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('About this Project'),
        ),
        body: const Center(
          child: Text('...'),
        ),
      );
    }
}
