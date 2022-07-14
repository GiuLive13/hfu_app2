import 'dart:io';
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
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:path_provider/path_provider.dart';

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
  final userMail = FirebaseAuth.instance.currentUser?.email;
  final userID = FirebaseAuth.instance.currentUser?.uid;
  PlatformFile? selectedFile;
  UploadTask? uploadTask;

  Future chooseFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      selectedFile = result.files.first;
    });
  }

  Future<String> uploadFile() async {
    final path = 'userFiles/profileImages/$userID/profilepicture';
    final chosenFile = File(selectedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    var uploadTask = ref.putFile(chosenFile);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        const CustomBackground(),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(height: 50),
                Text(
                  'Willkommen auf deinem Profil,',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              user.email! + '!',
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(userID!, style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 10
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(height: 90, width: 90,
              child: Stack(children: [
                InkWell(
                  onTap: chooseFile,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: (selectedFile != null)
                            ? Image.file(
                                File(selectedFile!.path!),
                                fit: BoxFit.fill,
                              )
                            : const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 80,
                              ),
                      ), /// Update Query & referenzieren auf Firestorage
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 5,),
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                          0.5,
                          0.9,
                          1.3,
                        ],
                        colors: [
                          Colors.green.shade200,
                          Colors.lightGreen.shade600,
                          Colors.green.shade900,
                        ])),
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
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 220,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          color: Colors.white24,
                        ),
                        child: TextFormField(
                          maxLines: 10,
                          initialValue: notes,
                          decoration: InputDecoration(
                            hintText: "Notizen",
                            hintStyle: TextStyle(
                                color: Colors.blueGrey.shade400, fontSize: 13),
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
                          margin: const EdgeInsets.all(5),
                          decoration:  BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: IconButton(
                              onPressed: () async {
                                //  await UserProfilePreferences.setUserStatus(userStatus);
                                await UserProfilePreferences.setNotes(notes);
                                uploadFile();
                                FocusScope.of(context).unfocus(); /// Keyboard pop
                              },
                              icon: const FaIcon(FontAwesomeIcons.floppyDisk, size: 30, color: Colors.white,),
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
                              color: Colors.black87,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180, left: 8),
                    child: Column(
                      children: [
                       StreamBuilder <QuerySnapshot<Map<String, dynamic>>>(
                         stream: readUserEntry(user),
                           builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              final userEntries = snapshot.data!.docs;

                              return SizedBox(
                                height: 100,
                                child: ListView(
                                  children: userEntries.map((entry) => buildUserEntry(context, Entry.fromSnapshot(entry))).toList(),
                                ),
                              );
                            } else {
                              return const Center(child: CircularProgressIndicator());
                            }
                           }
                       )
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

 Stream<QuerySnapshot<Map<String, dynamic>>> readUserEntry(User user) => FirebaseFirestore.instance.collection('entries').where("userContact", isEqualTo: user.email).snapshots();

 Widget buildUserEntry(BuildContext context, Entry entry) => Row(
      children: [
        const SizedBox(width: 25,),
        Text(entry.title, style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18
          ),
        ),
        IconButton(
          onPressed: _deleteUserEntry,
           icon: const FaIcon(FontAwesomeIcons.deleteLeft, color: Colors.red, size: 17,)
        )
      ] 
 );

  Future <void> _deleteUserEntry() async {
    FirebaseFirestore.instance.collection('entries').doc(FirebaseAuth.instance.currentUser!.email).delete();
    Utils.showSnackBar('Eintrag gelöscht');
  }
}
