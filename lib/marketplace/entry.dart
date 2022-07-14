import 'package:cloud_firestore/cloud_firestore.dart';

class Entry {
 // String id;
  String uid;
  final String title;
  final String userContact;
  final String description;
 // final String imagePath;
 /* var categories = <int, String> { Kategorien
    1: 'Dienstleistung',
    2: 'Wohnung/ Zimmer',
    3: 'Sonstiges'
  };*/
  //final Timestamp uploadTime;

  Entry({
  //  this.id = '',
    this.uid = '',
    required this.title,
    required this.userContact,
    required this.description,
    //required this.imagePath,
    //this.uploadTime = FieldValue.serverTimestamp(),
  });

  Map<String, dynamic> toJson() => {
     //   'id': id,
        'uid': uid,
        'title': title,
        'userContact': userContact,
        'description': description,
      //  'imagePath' : imagePath,
        //'uploadTime' : uploadTime,
      };

  static Entry fromJson(Map<String, dynamic> json) => Entry(
      // id: json['id'],
        uid: json['uid'],
        title: json['title'],
        userContact: json['userContact'],
        description: json['description'],
     //   imagePath: json['imagePath'],
        // uploadTime: json['uploadtimestamp']
      );

  static Entry fromSnapshot(DocumentSnapshot snapshot) {
    return Entry(
        uid: snapshot['uid'],
      //  id: snapshot['id'],
        title: snapshot['title'],
        userContact: snapshot['userContact'],
        description: snapshot['description'],
       // imagePath: snapshot['imagePath'],
    );
  }
}
