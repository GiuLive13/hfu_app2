import 'package:flutter/material.dart';

import 'package:hfu_app2/widgets/background_widget.dart';
import '../websites/web_view.dart';

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
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://felix.hs-furtwangen.de/dmz/',)));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 100,
              child: Card(
                margin: const EdgeInsets.only(left: 10, right: 35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.green.shade800,
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'FELIX',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://studi-portal.hs-furtwangen.de/')));
            },
            child: Container(
              padding:const EdgeInsets.only(top: 20),
              height: 100,
              child: Card(
                margin: const EdgeInsets.only(left: 35, right: 10),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.green.shade800,
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Studi-Portal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://webmail.hs-furtwangen.de/')));
            },
            child: Container(
              padding:const EdgeInsets.only(top: 20),
              height: 100,
              child: Card(
                margin: const EdgeInsets.only(left: 10, right: 35),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.green.shade800,
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Mail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://stundenplan.hs-furtwangen.de/splan/')));
            },
            child: Container(
              padding:const EdgeInsets.only(top: 20),
              height: 100,
              child: Card(
                margin: const EdgeInsets.only(left: 35, right: 10),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.green.shade800,
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Stundenplan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://howto.hs-furtwangen.de/aview/')));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 100,
              child: Card(
                margin:
                    const EdgeInsets.only(left: 10, right: 35),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colors.green.shade800,
                child: Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Alfaview',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.green.shade800,
              mini: true,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://www.hs-furtwangen.de/')));
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
