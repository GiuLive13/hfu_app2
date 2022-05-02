import 'package:flutter/material.dart';
import 'package:hfu_app2/homeDir/alfaview.dart';
import 'package:hfu_app2/homeDir/felix.dart';
import 'package:hfu_app2/homeDir/mail.dart';
import 'package:hfu_app2/homeDir/studiPortal.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import 'package:url_launcher/url_launcher.dart'; // Dependency für URL Links

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("HFU-Website"), // HFU Logo einbauen
        onPressed: () {

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
          ],
        ),
      ),
    );
  }


}
