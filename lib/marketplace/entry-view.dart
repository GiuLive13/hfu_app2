import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryView extends StatelessWidget{
  const EntryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Einsicht"),
      ),
      body: Container(
        child: Text("Inserat"),
      )
    );
  }

}