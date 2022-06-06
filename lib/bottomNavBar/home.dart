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
            ])),
        child: ListView(children: [
          Card(
            margin: const EdgeInsets.only(top: 6, left: 25, right: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'FELIX',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                ButtonBar(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FelixPortal()));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ]),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 4, left: 25, right: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Studi-Portal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                ButtonBar(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudiPortal()));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ]),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 4, left: 25, right: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Mail',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                ButtonBar(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Mail()));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ]),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 4, left: 25, right: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'Stundenplan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                ButtonBar(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Timetable()));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                ]),
              ],
            ),
          ),
          Card(
            margin:
                const EdgeInsets.only(top: 4, left: 25, right: 25, bottom: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    'AlfaView',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                ButtonBar(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Aview()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white)),
                ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.black,
              mini: true,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HfuWebsite()));
              },
              child: const Icon(Icons.house_rounded,
                  color: Colors.white, size: 30),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ]),
      ),
    );
  }
}
