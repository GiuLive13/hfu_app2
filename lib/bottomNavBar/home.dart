import 'package:flutter/material.dart';

import 'package:hfu_app2/homeDir/alfaview.dart';
import 'package:hfu_app2/homeDir/felix.dart';
import 'package:hfu_app2/homeDir/mail.dart';
import 'package:hfu_app2/homeDir/studiPortal.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import '../websites/hfu_website.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.9,
                  1.3,
                ],
                colors: [
                  Colors.white,
                  Colors.lightGreen.shade600,
                  Colors.green.shade900,
                ]
            )
        ),
          child: ListView(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),

            children: [
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              color: Colors.green.shade800,
                child: Column(
                  children: [
                     const ListTile(
                      title: Text(
                        'FELIX',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ),
                    ButtonBar(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FelixPortal()));
                              },
                              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.green.shade800,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'Studi-Portal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ),
                    ButtonBar(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StudiPortal()));
                              },
                              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.green.shade800,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'Mail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ),
                    ButtonBar(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Mail()));
                              },
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.green.shade800,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'Stundenplan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ),
                    ButtonBar(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Timetable()));
                              },
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.green.shade800,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'AlfaView',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white
                        ),
                      ),
                    ),
                    ButtonBar(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Aview()));
                              },
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.white,)
                          ),
                        ]
                    ),
                  ],
                ),
              ),
          /*    const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HfuWebsite()));
                      },
                      child: Image.asset('assets/images/hfu_website.png')
                  ),
                ],
              ) */
        ]),
      ),
    );
  }
}


