import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hfu_app2/marketplace/add_entry.dart';
import 'package:hfu_app2/marketplace/entry.dart';
import 'package:hfu_app2/userController/userprofile_preferences.dart';
import 'package:hfu_app2/userController/utils.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
//  String? dropdownValue;
  String notes = '';

  //List<String?> userStatus = [];

  @override
  void initState() {
    super.initState();

    // userStatus = UserProfilePreferences.getUserStatus() ?? [];
    notes = UserProfilePreferences.getNotes() ?? '';
  }

  final user = FirebaseAuth.instance.currentUser;
  String? _userImageUrl = FirebaseAuth.instance.currentUser?.photoURL;
  PlatformFile? selectedFile;
  UploadTask? uploadTask;

  Future chooseFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      selectedFile = result.files.first;
    });

    uploadFile();
    var uf = await uploadFile();
    await user?.updatePhotoURL(uf);
  }

  Future<String> uploadFile() async {
    final path = 'userFiles/profileImages/${user?.uid}/profilepicture';
    final chosenFile = File(selectedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    var uploadTask = ref.putFile(chosenFile);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();

    setState(() => _userImageUrl = downloadUrl);

    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        // const CustomBackground(),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(height: 50),
                Text(
                  'Willkommen auf deinem Profil,',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            AutoSizeText(
              user!.email! + '!',
              minFontSize: 20,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              user!.uid,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 9),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 90,
              width: 90,
              child: Stack(children: [
                InkWell(
                  onTap: chooseFile,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: _userImageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: _userImageUrl!,
                                placeholder:(context, url) => const CircularProgressIndicator(color: Colors.white, strokeWidth: 1,),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 80,
                              ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            /// Option für ein Dropdownmenu, welchen Status man hinsichtlich zur HFU hat.
            /// SharedPreferences-Methode
            /* DropdownButton<String>(
                  value: dropdownValue,
                  hint: const Text('Status'),
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: <String>["Studierend", "Lehrend", "Extern"].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? userStatus) {
                    setState((){
                      dropdownValue = userStatus!;
                    });

                  }
              ),*/
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withRed(600),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddEntry())),
                        child: Container(
                          padding: const EdgeInsets.only(left: 25, top: 5),
                          child: const Icon(
                            Icons.add_shopping_cart,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                        ),
                        child: TextFormField(
                          maxLines: 10,
                          initialValue: notes,
                          decoration: const InputDecoration(
                            hintText: "Notizen",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 10),
                          ),
                          onChanged: (notes) =>
                              setState(() => this.notes = notes),
                        ),
                      ),
                      InkWell(
                        onTap: () => FirebaseAuth.instance.signOut(),
                        child: Container(
                          padding: const EdgeInsets.only(right: 25, top: 5),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(12)),
                          child: IconButton(
                            onPressed: () async {
                              await UserProfilePreferences.setNotes(notes);
                              FocusScope.of(context).unfocus();

                              /// Keyboard pop
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.floppyDisk,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Marktplatzeintrag',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180, left: 40, right: 40),
                    child: Column(
                      children: [
                        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: readUserEntry(user!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final userEntries = snapshot.data!.docs;

                                return Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white38,
                                  ),
                                  child: ListView(
                                    children: userEntries
                                        .map((entry) => buildUserEntry(
                                            context, Entry.fromSnapshot(entry)))
                                        .toList(),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            })
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserEntry(User user) =>
      FirebaseFirestore.instance
          .collection('entries')
          .where("userContact", isEqualTo: user.email)
          .snapshots();

  Widget buildUserEntry(BuildContext context, Entry entry) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          entry.title,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
        ),
        IconButton(
            onPressed: _deleteUserEntry,
            icon: const FaIcon(
              FontAwesomeIcons.deleteLeft,
              color: Colors.red,
              size: 17,
            ))
      ]);



  Future<void> _deleteUserEntry() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Inserat wirklich entfernen?'),
          actions: [
            TextButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('entries')
                      .doc(FirebaseAuth.instance.currentUser!.email)
                      .delete();
                  Navigator.of(context).pop();
                  Utils.showSnackBar('Eintrag gelöscht');
                },
                child: const Text('Ja', style: TextStyle(fontSize: 24),
                )),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Nein', style: TextStyle(fontSize: 24),
                )),
          ],
        )
    );
  }
}
