import 'package:flutter/material.dart';

import 'package:hfu_app2/homeDir/alfaview.dart';
import 'package:hfu_app2/homeDir/felix.dart';
import 'package:hfu_app2/homeDir/mail.dart';
import 'package:hfu_app2/homeDir/studiPortal.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import '../homeDir/hfu_website.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.1,
                  0.4,
                  0.8,
                ],
                colors: [
                  Colors.white,
                  Colors.lightGreen.shade600,
                  Colors.green.shade900,
                ]
            )
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FelixPortal()));
                },
                child: const Text('FELIX',
                    style: TextStyle(
                      fontSize: 30,
                    ))
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudiPortal()));
                },
                child: const Text('Studi-Portal',
                    style: TextStyle(
                      fontSize: 30,
                    )
                )
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mail()));
              },
              child: const Text('HFU Mail',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Timetable()));
                },
                child: const Text('Stundenplan',
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Aview()));
                },
                child: const Text('AlfaView',
                    style: TextStyle(
                      fontSize: 30,
                    )
                )
            ),
            const SizedBox(height: 100),
            Container(
              child: Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}


