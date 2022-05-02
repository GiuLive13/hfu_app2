import 'package:flutter/material.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'homeDir/alfaview.dart';
import 'homeDir/felix.dart';
import 'homeDir/mail.dart';
import 'homeDir/studiPortal.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("HFU-Website"), // HFU Logo einbauen
        onPressed: () {
          launch('https://www.hs-furtwangen.de/');
        },
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView(
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          scrollDirection: Axis.vertical,
          children: [
            //Column(
            // children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FelixPortal()
                  ));
                },
                child: const Text('FELIX',
                    style: TextStyle(
                      fontSize: 30,
                    ))
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => StudiPortal()
                ));
              },
              child: const Text('Studi-Portal',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Mail()
                ));
              },
              child: const Text('Mail',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Timetable()
                  ));
                },
                child: const Text('Stundenplan',
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Aview()
                  ));
                },
                child: const Text('AlfaView',
                    style: TextStyle(
                      fontSize: 30,
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
