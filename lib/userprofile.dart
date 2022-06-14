import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hfu_app2/marketplace/add_entry.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? dropdownValue;

  final user = FirebaseAuth.instance.currentUser?.uid;
  PlatformFile? selectedFile;
  UploadTask? uploadTask;

  final titleController = TextEditingController();
  final userContactController = TextEditingController();
  final descriptionController = TextEditingController();

  Future chooseFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() { selectedFile = result.files.first;});
  }

  Future uploadFile() async {
    final path = 'userFiles/profileImages/$user/${selectedFile!.name}';
    final chosenFile = File(selectedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(chosenFile);

  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Stack(
          children: [
            const CustomBackground(),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(80, 30, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Willkommen auf deinem Profil,',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  user.email! + '!',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children:  [
                  if (selectedFile != null)
                   InkWell(
                     onDoubleTap: chooseFile,
                     onTap: uploadFile,
                     child: Center(
                       child: SizedBox(
                         height: 100,
                         width: 100,
                         child: CircleAvatar(
                               backgroundColor: Colors.transparent,
                               radius: 75,
                               child: Image.file(
                                   File(selectedFile!.path!),
                                   fit: BoxFit.cover,
                               ),
                               // Icon(Icons.account_circle, size: 35, color: Colors.white),
                         ),
                       ),
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 48),
                    child: Center(
                      child: IconButton(
                          onPressed: () =>
                            chooseFile(),
                          icon: FaIcon(FontAwesomeIcons.camera, size: 22, color: Colors.black)),
                    ),
                  )
                ]
              ),
              DropdownButton<String>(
                  value: dropdownValue,
                  hint: Text('Status'),
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
              ),
              const SizedBox(
                height: 20,
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
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: const Icon(
                              Icons.add_shopping_cart,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => FirebaseAuth.instance.signOut(),
                          child: Container(
                            padding: const EdgeInsets.only(right: 25, top: 10),
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
                      padding: const EdgeInsets.all(60.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                            columnSpacing: 20,
                            sortAscending: true,
                            sortColumnIndex: 0,
                            columns: const [
                              DataColumn(
                                  label: Text(
                                'Einträge',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                              DataColumn(
                                  label: Text(
                                    'Vom',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  numeric: true),
                              DataColumn(
                                  label: Text(
                                'Löschen',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ))
                            ],
                            rows: [
                              DataRow(cells: <DataCell>[
                                const DataCell(
                                  Text('Eintrag 1'),
                                ),
                                const DataCell(Text('Datum')),
                                DataCell(IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                )),
                              ])
                            ]),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
      ]),
    );
  }
}

/*
 Change password,
 Delete Account,
 Profilbild ?
 */
