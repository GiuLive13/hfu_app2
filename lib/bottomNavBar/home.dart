import 'package:flutter/material.dart';
import 'package:hfu_app2/homeDir/alfaview.dart';
import 'package:hfu_app2/homeDir/felix.dart';
import 'package:hfu_app2/homeDir/mail.dart';
import 'package:hfu_app2/homeDir/studi_portal.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

import '../websites/hfu_website.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const CustomBackground(),
        ListView(children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FelixPortal()));
            },
            child: Card(
              margin: const EdgeInsets.only(top: 6, left: 25, right: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'FELIX',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ButtonBar(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FelixPortal()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StudiPortal()));
            },
            child: Card(
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
                                  builder: (context) => const StudiPortal()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Mail()));
            },
            child: Card(
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
                              MaterialPageRoute(builder: (context) => const Mail()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Timetable()));
            },
            child: Card(
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
                                  builder: (context) => const Timetable()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ]),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Aview()));
            },
            child: Card(
              margin:
                  const EdgeInsets.only(top: 4, left: 25, right: 25, bottom: 5),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Alfaview',
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
                              MaterialPageRoute(builder: (context) => const Aview()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white)),
                  ]),
                ],
              ),
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
                    MaterialPageRoute(builder: (context) => const HfuWebsite()));
              },
              child: const Icon(Icons.house_rounded,
                  color: Colors.white, size: 30),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ]),
      ]),
    );
  }
}
