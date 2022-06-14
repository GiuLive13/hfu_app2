import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Entry {
  String id;
  String uid;
  final String title;
  final String userContact;
  final String description;
  //final String imagePath;
  //final Timestamp uploadTime;

  Entry({
    this.id = '',
    this.uid = '',
    required this.title,
    required this.userContact,
    required this.description,
   // required this.imagePath,
    //this.uploadTime = FieldValue.serverTimestamp(),
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'uid': uid,
    'title': title,
    'userContact': userContact,
    'description': description,
    //'imagePath' : imagePath,
    //'uploadTime' : uploadTime,
  };

  static Entry fromJson(Map<String, dynamic> json) => Entry(
    id: json['id'],
    uid: json['uid'],
    title: json['title'],
    userContact: json['userContact'],
    description: json['description'],
   // imagePath: json['imagePath'],
   // uploadTime: json['uploadtimestamp']
  );

}
