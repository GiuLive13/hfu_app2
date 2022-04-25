import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Dependency für URL Links

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
          // interne Webansicht umsetzen
          padding: const EdgeInsets.only(top: 80, right: 30, left: 30),
          scrollDirection: Axis.vertical,
          children: [
            //Column(
            // children: [
            ElevatedButton(
                onPressed: () {
                  launch('https://felix.hs-furtwangen.de/dmz/');
                },
                child: const Text('FELIX',
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            ElevatedButton(
              onPressed: () {
                launch('https://webmail.hs-furtwangen.de/');
              },
              child: const Text('HFU Mail',
                  style: TextStyle(
                    fontSize: 30,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  launch('https://stundenplan.hs-furtwangen.de/');
                },
                child: const Text('Stundenplan',
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            ElevatedButton(
                onPressed: () {
                  launch('https://howto.hs-furtwangen.de/aview/');
                },
                child: const Text('AlfaView',
                    style: TextStyle(
                      fontSize: 30,
                    ))),
            /*  ElevatedButton(
                      onPressed: ( ) {
                        launch('https://www.hs-furtwangen.de/');
                      },
                      child: const Text('Webseite',
                          style: TextStyle(
                            fontSize: 30,
                          ))
                  ), Link zur Website */
            /*  const Image(
                alignment: Alignment.bottomRight,
                  width: 40,
                  height: 100,
                image: NetworkImage('https://www.binder-world.com/var/plain_site/storage/images/international/home/news-presse/presse/pressemitteilungen/kooperation-mit-hfu-campus-tuttlingen/1528847-1-ger-DE/Kooperation-mit-HFU-Campus-Tuttlingen_large.jpg'))
    */
          ],
        ),
      ),
    );
  }
}
