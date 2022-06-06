import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/marketplace/addEntry.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.4,
                0.9,
                1.3,
              ],
                  colors: [
                Colors.green.shade50,
                Colors.lightGreen.shade600,
                Colors.green.shade900,
              ])),
          child: Column(
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
                height: 20,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 30,
                  child:
                      Icon(Icons.account_circle, size: 30, color: Colors.white),
                ),
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
                                  builder: (context) => AddEntry())),
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
                              DataColumn(label: Text('Einträge',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                              DataColumn(label: Text('Vom',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),), numeric: true),
                              DataColumn(label: Text('Löschen',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),))
                            ], rows: [
                              DataRow(
                                  cells: <DataCell>[
                                DataCell(Text('Eintrag 1'), showEditIcon: true,),
                                DataCell(Text('Datum')),
                                DataCell(IconButton(
                                  onPressed: () {  },
                                  icon: Icon(Icons.delete),
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
