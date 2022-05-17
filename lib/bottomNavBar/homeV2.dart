import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hfu_app2/homeDir/alfaview.dart';
import 'package:hfu_app2/homeDir/felix.dart';
import 'package:hfu_app2/homeDir/mail.dart';
import 'package:hfu_app2/homeDir/studiPortal.dart';
import 'package:hfu_app2/homeDir/timetable.dart';
import '../homeDir/hfu_website.dart';

class HomeV2 extends StatefulWidget {
  @override
  _HomeV2State createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                0.7
              ],
              colors: [
                Colors.white70,
                Colors.green.shade800,
              ]
            )
          ),
        child: GridView.count(
          childAspectRatio: 2/2,
          padding: EdgeInsets.all(20),
            crossAxisCount: 2,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(5) ,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.8,
                              1.1
                            ],
                            colors: [
                              Colors.green.shade800,
                              Colors.green.shade800
                            ],
                          )
                      ),
                    child: Text("Felix",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FelixPortal()));
                }
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5) ,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            stops: [
                              0.7,
                              0.9
                            ],
                            colors: [
                              Colors.green.shade800,
                              Colors.green.shade200
                            ],
                          )
                      ),
                    child: Text("Mail",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FelixPortal()));
                },
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5) ,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.2,
                              0.8
                            ],
                            colors: [
                              Colors.green.shade800,
                              Colors.green.shade200
                            ],
                          )
                      ),
                    child: Text("Stundenplan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FelixPortal()));
                },
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5) ,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.2,
                        0.8
                      ],
                      colors: [
                        Colors.green.shade800,
                        Colors.green.shade200
                      ],
                    )
                  ),
                  child: Text("Studi-Portal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FelixPortal()));
                }
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5) ,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.2,
                              0.8
                            ],
                            colors: [
                              Colors.green.shade800,
                              Colors.green.shade800
                            ],
                          )
                      ),
                    child: Text("AlfaView",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Aview()));
                }
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
        )
        ),
      );
  }
}