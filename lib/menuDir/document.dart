import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/pdfView/hfu_beitragssatzung.dart';
import 'package:hfu_app2/pdfView/info_pregnancy.dart';
import 'package:hfu_app2/pdfView/merkblatt_studieren_mit_kind.dart';
import 'package:hfu_app2/pdfView/re_registration.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../pdf_viewer.dart';


class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dokumente'),
      ),
      body: Stack(
        children: [
          const CustomBackground(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.black45),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Verschiedenes', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/user_upload/ze_iaf/Dokumente/2019.06.01_Regeln_zur_Sicherung_wissenschaftlicher_Praxis.pdf',
                                fileName: 'Regeln_zur_Sicherung_wissenschaftlicher_Praxis.pdf',
                              ),
                              child: const Text('Regeln - wissenschaftliches Arbeiten', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/SPOs/AllgemeinerTeilBachelor_aktuell.pdf',
                                fileName: 'SPO_Bachelor.pdf',
                              ),
                              child: const Text('SPO_Bachelor', style: TextStyle(
                                fontSize: 17
                              ),)
                          ),
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/SPOs/AllgemeinerTeil_aktuell.pdf',
                                fileName: 'SPO_Master.pdf',
                              ),
                              child: const Text('SPO_Master', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () async {
                                const url =
                                    'documents/important_docs/VSt_Beitragssatzung_Verfasste-Studierendenschaft_2014_01_02.pdf';
                                final file =
                                await PDFViewer.loadFirebase(url);

                                if (file == null) return;
                                beitragssatzPDF(context, file);
                              },
                              child: const Text(
                                'Beitragssatzung',
                                style: TextStyle(
                                  fontSize: 17,

                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Antrag_B-Semester.pdf',
                                fileName: 'Antrag_B-Semester.pdf',
                              ),
                              child: const Text('B-Semester', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Antrag_auf_Beurlaubung.pdf',
                                fileName: 'Antrag_Beurlaubung.pdf',
                              ),
                              child: const Text('Beurlaubung', style: TextStyle(
                                  fontSize: 17,
                              ),)
                          ),
                        ],
                      )
                    ],
                  )
                ),
                const Divider(color: Colors.black, thickness: 1, indent: 25, endIndent: 25,),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.black45),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Studiensemester', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/MitteilungAuslandsstudiensemester.pdf',
                                fileName: 'Mitteilung_Auslandssemester.pdf',
                              ),
                              child: const Text('Auslandssemester', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Mitteilung_ueber_praktisches_Studiensemester_Furtwangen.pdf',
                                fileName: 'Mitteilung_Praktisches_Studiensemester.pdf',
                              ),
                              child: const Text('Praxissemester(Fu)', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Mitteilung_ueber_praktisches_Studiensemester_Tuttlingen.pdf',
                                fileName: 'Mitteilung_Praktisches_Studiensemester.pdf',
                              ),
                              child: const Text('Praxissemester(Tut)',overflow: TextOverflow.fade, style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Mitteilung_ueber_praktisches_Studiensemester_VS.pdf',
                                fileName: 'Mitteilung_Praktisches_Studiensemester.pdf',
                              ),
                              child: const Text('Praxissemester(VS)', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1, indent: 25, endIndent: 25,),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.black45),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Abschlußarbeit', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Anmeldung_Bachelorarbeit.pdf',
                                fileName: 'Antrag_Bachelor.pdf',
                              ),
                              child: const Text('Antrag Bachelor', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Anmeldung_Masterarbeit.pdf',
                                fileName: 'Antrag_Master.pdf',
                              ),
                              child: const Text('Antrag Master', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Vorsicht! Einige Fakultäten nutzen individuelle Anträge!', style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: Colors.red
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1, indent: 25, endIndent: 25,),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.black45),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Exmatrikulation & Rückmeldung', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Antrag_auf_Exmatrikulation_deutsch.pdf',
                                fileName: 'Antrag_auf_Exmatrikulation.pdf',
                              ),
                              child: const Text('Exmatrikulation', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  const url =
                                      'documents/important_docs/Rueckmeldung_deutsch.pdf';
                                  final file =
                                  await PDFViewer.loadFirebase(url);

                                  if (file == null) return;
                                  reRegisterPDF(context, file);
                                },
                                child: const Text(
                                  'Informationen zur Rückmeldung',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                )),
                          ]
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1, indent: 25, endIndent: 25,),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.black45),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Schwangerschaft', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () async {
                                const url =
                                    'documents/important_docs/Schwangerschaft_Studentinnen.pdf';
                                final file =
                                await PDFViewer.loadFirebase(url);

                                if (file == null) return;
                                infoPregPDF(context, file);
                              },
                              child: const Text(
                                'Information',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                          ),
                          TextButton(
                              onPressed: () async {
                                const url =
                                    'documents/important_docs/Studieren_mit_Kind_Merkblatt.pdf';
                                final file =
                                await PDFViewer.loadFirebase(url);

                                if (file == null) return;
                                merkblattPregPDF(context, file);
                              },
                              child: const Text(
                                'Merkblatt',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () => openFile(
                                url: 'https://www.hs-furtwangen.de/fileadmin/Redaktion/Share/Formulare/Mitteilung_MuSchu_Elternzeit_deutsch.pdf',
                                fileName: 'Mitteilung_Schwangerschaft_Mutterschutz.pdf',
                              ),
                              child: const Text('Mitteilung Schwangerschaft', style: TextStyle(
                                  fontSize: 17
                              ),)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 3, indent: 25, endIndent: 25,),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 2, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(height: 28, width: 10,),
                          Text('Hinweis', style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              decoration: TextDecoration.underline
                          ),
                          ),
                        ],
                      ),
                      const Text('Prüfungsan- und abmeldungen nur über Studi-Portal möglich!', textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void beitragssatzPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Beitragssatzung(file: file)),
    );
  }
  void reRegisterPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ReRegistration(file: file)),
    );
  }

  void infoPregPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => InfoPregnancy(file: file)),
    );
  }
  void merkblattPregPDF(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MerkblattPregnancy(file: file)),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0
        ),
      );
      
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      
      return file;
    } catch (e) {
      return null;
    }

  }
}
