import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hfu_app2/websites/web_view.dart';
import 'package:hfu_app2/widgets/background_widget.dart';

import '../widgets/appbar_widget.dart';

class AboutProject extends StatelessWidget {
    AboutProject({Key? key}) : super(key: key);
  final userMail = FirebaseAuth.instance.currentUser?.email;
  final userID = FirebaseAuth.instance.currentUser?.uid;
  final String appVersion = 'Version 0.0.1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(pageTitle: 'About',),
      body: Stack(children: [
        const CustomBackground(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Text(appVersion, style: const TextStyle(
                      fontStyle: FontStyle.italic
                    ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://howto.hs-furtwangen.de/faq/'))),
                      child: const Text(
                        'FAQ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30
                        ),
                      )
                  ),
                ],
              ),
            ),
            const Text('Impressum', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25
            ),),
            const SizedBox(height: 300,),
            Column(
              children: [
                Row(children: <Widget>[
                  const SizedBox(
                    height: 80,
                    width: 8,
                  ),
                  const Text(
                    "Folge uns auf ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('Instagram',
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      RotateAnimatedText('Twitter',
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      RotateAnimatedText('LinkedIn',
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      RotateAnimatedText('XING',
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                    ],
                  ),
                ]),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebsiteView(initialUrl: 'https://www.instagram.com/hs.furtwangen/?hl=de'))),
                        icon: const FaIcon(
                          FontAwesomeIcons.instagram,
                          semanticLabel: "Instagram",
                          size: 34,
                          color: Colors.deepPurple,
                        )),
                    IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WebsiteView(initialUrl: 'https://twitter.com/hs_furtwangen?lang=de'))),
                        icon: const FaIcon(
                          FontAwesomeIcons.twitter,
                          semanticLabel: "Twitter",
                          size: 34,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebsiteView(initialUrl: 'https://www.linkedin.com/school/hochschule-furtwangen-university/?originalSubdomain=de'))),
                        icon: const FaIcon(
                          FontAwesomeIcons.linkedin,
                          semanticLabel: "LinkedIn",
                          size: 34,
                          color: Colors.blueAccent,
                        )),
                    IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebsiteView(initialUrl: 'https://www.xing.com/pages/hochschulefurtwangenuniversity'))),
                        icon: const FaIcon(
                          FontAwesomeIcons.xing,
                          semanticLabel: "XING",
                          size: 34,
                          color: Colors.teal,
                        )),
                  ],
                ),
              /// Null check error
              /*  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(userMail! + " " + "mit der ID: " + userID!, style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic
                    )
                    ),
                  ),
                ) */
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
