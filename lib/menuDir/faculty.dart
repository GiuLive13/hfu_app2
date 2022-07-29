import 'package:flutter/material.dart';

import 'package:hfu_app2/widgets/appbar_widget.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:hfu_app2/faculties/facultyStructure.dart';
import 'package:hfu_app2/widgets/faculty_widget.dart';

List<Faculty> faculties = [
  Faculty(
      'Digitale Medien',
      'https://www.hs-furtwangen.de/fakultaeten/digitale-medien/',
      'assets/images/dm.png'),
  Faculty(
      'Gesundheit, Sicherheit, Gesellschaft',
      'https://www.hs-furtwangen.de/fakultaeten/gesundheit-sicherheit-gesellschaft/',
      'assets/images/gsg.png'),
  Faculty(
      'Industrial Technologies',
      'https://www.hs-furtwangen.de/fakultaeten/industrial-technologies/',
      'assets/images/ite.png'),
  Faculty('Informatik', 'https://www.hs-furtwangen.de/fakultaeten/informatik/',
      'assets/images/in.png'),
  Faculty(
      'Medical and Life Sciences',
      'https://www.hs-furtwangen.de/fakultaeten/medical-and-life-sciences/',
      'assets/images/mls.png'),
  Faculty(
      'Mechanical & Medical Engineering',
      'https://www.hs-furtwangen.de/fakultaeten/mechanical-and-medical-engineering/',
      'assets/images/mme.png'),
  Faculty('Wirtschaft', 'https://www.hs-furtwangen.de/fakultaeten/wirtschaft/',
      'assets/images/w.png'),
  Faculty(
      'Wirtschaftsinformatik',
      'https://www.hs-furtwangen.de/fakultaeten/wirtschaftsinformatik/',
      'assets/images/wib.png'),
  Faculty(
      'Wirtschaftsingenieurwesen',
      'https://www.hs-furtwangen.de/fakultaeten/wirtschaftsingenieurwesen/',
      'assets/images/wing.png'),
];

class FacultyView extends StatelessWidget {
  const FacultyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomMainAppBar(
          pageTitle: 'Fakultäten',
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          const CustomBackground(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 10 / 8 ,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: faculties.length,
              itemBuilder: (BuildContext context, int index) {
                return FacultyWidget(faculty: faculties[index]);
              },
            ),
          ),
        ]));
  }
}
