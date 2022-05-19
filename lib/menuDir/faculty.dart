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
        title: const Text('Fakultäten'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.7,
                  0.9,
                ],
                colors: [
                  Colors.white,
                  Colors.lightGreen.shade600,
                  Colors.green.shade900,
                ]
            )
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Digitale Medien',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                  ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DigitalMedia()));
                  },
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Gesundheit, Sicherheit, Gesellschaft',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HSS()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Industrial Technologies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InduTech()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Informatik',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ComScience()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Medical and Life Sciences',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedLifeScience()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Mechanical and Medical Engineering',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MechMediEngineering()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Wirtschaft',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Business()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Wirtschaftsinformatik',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BusInfo()));
                  },
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: const Text('Wirtschaftsingenieurwesen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BusAdmin()));
                  },
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black,)
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
          ],
        ),
      )
    );
  }
}
