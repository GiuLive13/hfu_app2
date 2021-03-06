import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hfu_app2/pdfView/pdf_view.dart';
import 'package:hfu_app2/pdfView/pdf_viewer.dart';

import 'package:hfu_app2/websites/web_view.dart';
import '../widgets/appbar_widget.dart';


class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(pageTitle: 'Standorte',),
      body: Stack(
        children: [
        //  const CustomBackground(),
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 500,
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                SizedBox(
                                  width: 8, height: 30,
                                ),
                                Text(
                                  'Furtwangen',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(children: const [
                                  SizedBox(width: 8, height: 23,),
                                  Text('Adresse: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                  Text('Robert-Gerwig-Platz 1', style: TextStyle(fontSize: 16),),
                                ]),
                                Row(
                                  children: const [
                                    SizedBox(width: 75,),
                                    Text('78120 Furtwangen im Schwarzwald', style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Row(children: const [
                                  SizedBox(width: 8, height: 10,),
                                  Text('Telefon: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 7,),
                                  Text('07723/9200', style: TextStyle(fontSize: 16),),

                                ],),
                                Row(children: [
                                  const SizedBox(width: 8, height: 10,),
                                  const Text('Mensa: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                  TextButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebsiteView(initialUrl: 'https://www.swfr.de/essen-trinken/speiseplaene/mensa-furtwangen/'))),
                                    child: const Text('Essensplan der Woche', style: TextStyle(fontSize: 16)),
                                  ),
                                ],),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const FaIcon(
                                      FontAwesomeIcons.solidFilePdf,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          const url =
                                              'campuspl??ne/Furtwangen_Lageplan.pdf';
                                          final file =
                                          await PDFViewer.loadFirebase(url);

                                          if (file == null) return;
                                          documentView(context, file);
                                        },
                                        child: const Text(
                                          'Campusplan Furtwangen',
                                          style: TextStyle(
                                              decoration: TextDecoration.underline),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(thickness: 1, indent: 25, endIndent: 25,),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 8, height: 30,
                              ),
                              Text(
                                'Tuttlingen',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(children: const [
                                SizedBox(width: 8, height: 23,),
                                Text('Adresse: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                Text('Kronenstra??e 16', style: TextStyle(fontSize: 16),),
                              ]),
                              Row(
                                children: const [
                                  SizedBox(width: 75,),
                                  Text('78532 Tuttlingen', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                              Row(children: const [
                                SizedBox(width: 8, height: 18,),
                                Text('Telefon: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(width: 7,),
                                Text('07461/15020 ', style: TextStyle(fontSize: 16),),
                              ],),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const FaIcon(
                                    FontAwesomeIcons.solidFilePdf,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        const url =
                                            'campuspl??ne/HFU_Campusplan_TUT.pdf';
                                        final file =
                                        await PDFViewer.loadFirebase(url);

                                        if (file == null) return;
                                        documentView(context, file);
                                      },
                                      child: const Text(
                                        'Campusplan Tuttlingen',
                                        style: TextStyle(
                                            decoration: TextDecoration.underline),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          const Divider(thickness: 1, indent: 25, endIndent: 25,),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 8, height: 30,
                              ),
                              Text(
                                'VS-Schwenningen',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(children: const [
                                SizedBox(width: 8, height: 23,),
                                Text('Adresse: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                Text('Jakob-Kienzle-Stra??e 17', style: TextStyle(fontSize: 16),),
                              ]),
                              Row(
                                children: const [
                                  SizedBox(width: 75,),
                                  Text('78054 Villingen-Schwenningen', style: TextStyle(fontSize: 16),),
                                ],
                              ),
                              Row(children: const [
                                SizedBox(width: 8, height: 15,),
                                Text('Telefon: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(width: 7,),
                                Text('07720/3070', style: TextStyle(fontSize: 16),)
                              ],),
                              Row(children: [
                                const SizedBox(width: 8, height: 5,),
                                const Text('Mensa: ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, fontWeight: FontWeight.bold),),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebsiteView(initialUrl: 'https://www.swfr.de/essen-trinken/speiseplaene/mensa-schwenningen/'))),
                                  child: const Text('Essensplan der Woche', style: TextStyle(fontSize: 16)),
                                ),
                              ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const FaIcon(
                                FontAwesomeIcons.solidFilePdf,
                                color: Colors.red,
                                size: 18,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    const url =
                                        'campuspl??ne/HFU_Campusplan_VS.pdf';
                                    final file =
                                    await PDFViewer.loadFirebase(url);

                                    if (file == null) return;
                                    documentView(context, file);
                                  },
                                  child: const Text(
                                    'Campusplan VS-Schwenningen',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, indent: 25, endIndent: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.solidFilePdf,
                            color: Colors.red,
                            size: 18,
                          ),
                          TextButton(
                              onPressed: () async {
                                const url =
                                    'campuspl??ne/HFU_Studienzentrum_RW.pdf';
                                final file =
                                await PDFViewer.loadFirebase(url);

                                if (file == null) return;
                                documentView(context, file);
                              },
                              child: const Text(
                                'Studienzentrum Rottweil',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.solidFilePdf,
                            color: Colors.red,
                            size: 18,
                          ),
                          TextButton(
                              onPressed: () async {
                                const url =
                                    'campuspl??ne/HFU_Studienzentrum_FR.pdf';
                                final file =
                                await PDFViewer.loadFirebase(url);

                                if (file == null) return;
                                documentView(context, file);
                              },
                              child: const Text(
                                'Studienzentrum Freiburg',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      )
                    ],
                  ),
              ),]
          ),]
      ),
    );
  }
  void documentView(BuildContext context, File file) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DocumentViewer(file: file)),
    );
  }
}
