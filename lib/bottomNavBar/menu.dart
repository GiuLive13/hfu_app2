import 'package:flutter/material.dart';
import 'package:hfu_app2/menuDir/dates_deadlines.dart';
import 'package:hfu_app2/menuDir/document.dart';
import 'package:hfu_app2/menuDir/events.dart';
import 'package:hfu_app2/menuDir/faculty.dart';
import 'package:hfu_app2/menuDir/location.dart';
import 'package:hfu_app2/menuDir/marketplace.dart';
import 'package:hfu_app2/menuDir/news.dart';

import '../menuDir/reftreff.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card( // Lizenzfreie Bilder
              elevation: 4.0,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Dokument",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    subtitle: Text("Wichtige Dokumente rund um das Studium"),
                    //  trailing: Icon(Icons.launch),
                  ),
                  SizedBox(
                    height: 140.0,
                    child: Image.asset(
                      'assets/images/document.jpg', // Dokumentbild
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                    alignment: Alignment.centerLeft,
                    child: const Text("Thesisanmeldung und weitere Infos"),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        child: const Text(
                          "Dokumente ansehen",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Document())),
                      ),
                    ],
                  )
                ],
              )),
          Card(
            elevation: 4.0,
            child: Column(children: [
              const ListTile(
                title: Text(
                  "Termine und Fristen",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                subtitle: Text("Von Deadlines bis Prüfungsplänen"),
                //  trailing: Icon(Icons.launch),
              ),
              SizedBox(
                height: 140.0,
                child: Image.asset(
                  'assets/images/hfu_website_adaptive_fore.png', // HFU-Flagge
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                alignment: Alignment.centerLeft,
                child: const Text(
                    "Das müsst ihr wissen für das aktuelle Semester"
                ),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text(
                      "Hier anschauen",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DatesAndDeadlines())),
                  ),
                ],
              ),
            ]),
          ),
          Card(
            elevation: 4.0,
            child: Column(children: [
              const ListTile(
                title: Text(
                  "Fakultäten",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                subtitle: Text("Welche Fakultäten sind Teil der HFU?"),
                //  trailing: Icon(Icons.launch),
              ),
              SizedBox(
                height: 140.0,
                child: Image.asset(
                  'assets/images/hfu_website_adaptive_fore.png', // HFU-Flagge
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                alignment: Alignment.centerLeft,
                child: const Text(
                    "Erkunde dich über die einzelnen Fakultäten der HFU"),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text(
                      "Jetzt durchschauen",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Faculty())),
                  ),
                ],
              ),
            ]),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Standorte",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  subtitle: Text("Campuspläne der drei Standorte"),
                  //  trailing: Icon(Icons.launch),
                ),
                SizedBox(
                  height: 110.0,
                  child: Image.asset(
                    'assets/images/locations.jpg', // Mapstyle-Bild
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                      '"Wo ist eigentlich das O-Gebäude in Furtwangen?"'),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Hier loslegen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Location())),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Markplatz",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  subtitle: Text("Ich suche/ biete ..."),
                  //  trailing: Icon(Icons.launch),
                ),
                SizedBox(
                  height: 140.0,
                  child: Image.asset(
                    'assets/images/hfu_website_adaptive_fore.png', // passendes Bild suchen
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text("Suchst du eine neue WG oder Nachhilfe?"),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Hier loslegen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Marketplace())),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Veranstaltungen",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  subtitle: Text("Termine für Referate, Jobbörse, etc."),
                  //  trailing: Icon(Icons.launch),
                ),
                SizedBox(
                  height: 140.0,
                  child: Image.asset(
                    'assets/images/hfu_website_adaptive_fore.png',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text("Wann, Was und Wo?"),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Hier anschauen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Event())),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "News",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  subtitle: Text("Aktuelle Informationen"),
                  //  trailing: Icon(Icons.launch),
                ),
                SizedBox(
                  height: 140.0,
                  child: Image.asset(
                    'assets/images/hfu_website_adaptive_fore.png', // Alert Icon
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child:
                      const Text("Bleibe up-to-date und informiere dich hier"),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Hier anschauen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => News())),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Reftreff",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  subtitle: Text("Freizeitaktivitäten an deinem Campus"),
                  //  trailing: Icon(Icons.launch),
                ),
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    'assets/images/reftreff.jpg', // Alert Icon
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child:
                  const Text("Jetzt aktiv werden und neue Leute treffen"),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Hier anschauen",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Reftreff())),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
