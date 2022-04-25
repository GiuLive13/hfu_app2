import 'package:flutter/material.dart';
import 'package:hfu_app2/menuDir/document.dart';
import 'package:hfu_app2/menuDir/events.dart';
import 'package:hfu_app2/menuDir/faculty.dart';
import 'package:hfu_app2/menuDir/location.dart';
import 'package:hfu_app2/menuDir/marketplace.dart';
import 'package:hfu_app2/menuDir/news.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
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
                      'assets/images/beispiel.png', // Dokumentbild
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
                  'assets/images/beispiel.png', // HFU-Flagge
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
                  height: 140.0,
                  child: Image.asset(
                    'assets/images/beispiel.png', // Mapstyle-Bild
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
                    'assets/images/beispiel.png', // passendes Bild suchen
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: const Text("Marktplatz HFU"),
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
                    'assets/images/beispiel.png', //
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
                          MaterialPageRoute(builder: (context) => Events())),
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
                    'assets/images/beispiel.png', // Alert Icon
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
        ],
      ),
    );
  }
}
