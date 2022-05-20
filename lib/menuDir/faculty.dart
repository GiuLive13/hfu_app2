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
        child: ListView(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Digitale Medien',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                    ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DigitalMedia()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Gesundheit, Sicherheit, Gesellschaft',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HSS()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Industrial Technologies',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InduTech()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Informatik',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ComScience()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Medical and Life Sciences',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MedLifeScience()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.white70,
                  width: 2
                )
              ),
              child: ListTile(
                title: const Text('Mechanical and Medical Engineering',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MechMediEngineering()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Wirtschaft',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Business()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Wirtschaftsinformatik',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BusInfo()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                      color: Colors.white70,
                      width: 2
                  )
              ),
              child: ListTile(
                title: const Text('Wirtschaftsingenieurwesen',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BusAdmin()));
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
