import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/faculties/business-administration.dart';
import 'package:hfu_app2/faculties/business-information.dart';
import 'package:hfu_app2/faculties/business.dart';
import 'package:hfu_app2/faculties/com-science.dart';
import 'package:hfu_app2/faculties/digital-media.dart';
import 'package:hfu_app2/faculties/healt-safety-society.dart';
import 'package:hfu_app2/faculties/indu-tech.dart';
import 'package:hfu_app2/faculties/mech-medic-engineering.dart';
import 'package:hfu_app2/faculties/medic-life-science.dart';

class Faculty extends StatelessWidget {
  const Faculty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Fakultäten',
        style: TextStyle(
          fontWeight: FontWeight.w900
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 10,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.2,
                  0.9,
                ],
                colors: [
                  Colors.green.shade500,
                  Colors.green.shade600,
                  Colors.green.shade900,
                ]
            )
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 10/8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          ),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DigitalMedia()));
                },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('DM',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                      ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HSS()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('GSG',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InduTech()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('ITE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ComScience()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedLifeScience()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('MLS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => MechMediEngineering()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Colors.white70,
                    width: 2
                  )
                ),
                child: const ListTile(
                  title: Text('MME',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),),

                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Business()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('W',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusInfo()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('WIB',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),

                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusAdmin()));
              },
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                        color: Colors.white70,
                        width: 2
                    )
                ),
                child: const ListTile(
                  title: Text('WING',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
