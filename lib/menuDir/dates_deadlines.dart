import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatesAndDeadlines extends StatelessWidget {
  const DatesAndDeadlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termine und Fristen'),
      ),
    );
  }
}