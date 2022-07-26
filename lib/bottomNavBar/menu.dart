import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hfu_app2/menuDir/dates_deadlines.dart';
import 'package:hfu_app2/menuDir/document.dart';
import 'package:hfu_app2/menuDir/events.dart';
import 'package:hfu_app2/menuDir/faculty.dart';
import 'package:hfu_app2/menuDir/location.dart';
import 'package:hfu_app2/menuDir/marketplace.dart';
import 'package:hfu_app2/menuDir/news.dart';
import 'package:hfu_app2/websites/web_view.dart';
import 'package:hfu_app2/widgets/background_widget.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // Marktplatz nur klickbar wenn eingeloggt

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          ListView(
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Document())),
              child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
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
                      const SizedBox(
                          height: 90.0,
                          child: FaIcon(
                            FontAwesomeIcons.book, size: 80, color: Colors.brown,
                          )
                      ),
                      Container(
                        padding:
                        const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                        alignment: Alignment.centerLeft,
                        child: const Text("Thesisanmeldung und weitere Infos", style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic
                        ),),
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
                                    builder: (context) => const Document())),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DatesAndDeadlines())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(children: [
                  const ListTile(
                    title: Text(
                      "Termine und Fristen",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Text("Von Deadlines bis Prüfungsplänen"),
                    //  trailing: Icon(Icons.launch),
                  ),
                  const SizedBox(
                      height: 90.0,
                      child: FaIcon(
                        FontAwesomeIcons.solidBell, size: 80, color: Colors.lightGreen,

                      )
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Das müsst ihr wissen für das aktuelle Semester", style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic
                    ),
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
                            MaterialPageRoute(builder: (context) => const DatesAndDeadlines())),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FacultyView())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                    height: 95.0,
                    child: Image.asset(
                      'assets/images/Logo_HFU_transparent.png',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Detailansicht der HFU-Fakultäten", style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic
                    ),),
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
                            MaterialPageRoute(builder: (context) => const FacultyView())),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Locations())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                      height: 100.0,
                      child: Image.asset(
                        'assets/images/locations.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '"Wo ist eigentlich das O-Gebäude?"', style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                      ),),
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
                              MaterialPageRoute(builder: (context) => const Locations())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Marketplace())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                    const SizedBox(
                        height: 90.0,
                        child: FaIcon(
                          FontAwesomeIcons.shop, size: 80, color: Colors.lightBlue,

                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                      alignment: Alignment.centerLeft,
                      child: const Text("Suchst du eine neue WG oder Nachhilfe?", style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                      ),),
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
                                  builder: (context) => const Marketplace())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Event())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                    const SizedBox(
                        height: 90.0,
                        child: FaIcon(
                          FontAwesomeIcons.calendar, size: 80, color: Colors.redAccent,

                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                      alignment: Alignment.centerLeft,
                      child: const Text("Wann, Was und Wo?", style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                      ),),
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
                              MaterialPageRoute(builder: (context) => const Event())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const News())),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                    const SizedBox(
                        height: 90.0,
                        child: FaIcon(
                          FontAwesomeIcons.newspaper, size: 80, color: Colors.orangeAccent,
                        )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                      alignment: Alignment.centerLeft,
                      child:
                      const Text("Bleibe up-to-date und informiere dich hier", style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                      ),),
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
                              MaterialPageRoute(builder: (context) => const News())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://reftreff.hs-furtwangen.de/'))),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
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
                        'assets/images/reftreff.png', // Alert Icon
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 2),
                      alignment: Alignment.centerLeft,
                      child:
                      const Text("Gehe deinen Hobbys nach!", style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                      ),),
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
                              MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://reftreff.hs-furtwangen.de/'))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),]
      ),
    );
  }
}
