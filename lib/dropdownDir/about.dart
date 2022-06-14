import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hfu_app2/websites/hfu_faq.dart';
import 'package:hfu_app2/websites/hfu_instagram.dart';
import 'package:hfu_app2/websites/hfu_linkedIn.dart';
import 'package:hfu_app2/websites/hfu_twitter.dart';
import 'package:hfu_app2/widgets/background_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../websites/hfu_xing.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About HFU'),
      ),
      body:
           Stack(
             children: [
               const CustomBackground(),
               Column(
                 children: [
                   SizedBox(
                     height: 450,
                     child: Row(
                       children: [
                         const Text('FAQ', style: TextStyle(
                           fontSize: 22
                         ),),
                         IconButton(
                             onPressed: () => Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => const FAQ())),
                             icon: const FaIcon(FontAwesomeIcons.circleQuestion, size: 30,)
                         ),
                       ],
                     ),
                   ),
                   Row(
                       children: <Widget>[
                         const SizedBox(height:80,width: 8,),
                         const Text("Folge uns auf ", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
                         AnimatedTextKit(
                           repeatForever: true,
                           animatedTexts: [
                             RotateAnimatedText('Instagram', textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                             RotateAnimatedText('Twitter', textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                             RotateAnimatedText('LinkedIn', textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                             RotateAnimatedText('XING', textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                           ],
                         ),
                       ]
                   ),
                   Row(
                     children: [
                       IconButton(
                           onPressed: () => Navigator.push(context,
                               MaterialPageRoute(builder: (context) => InstaLink())),
                           icon: const FaIcon(FontAwesomeIcons.instagram, semanticLabel: "Instagram", size: 34, color: Colors.deepPurple,)
                       ),
                       IconButton(
                           onPressed: () => Navigator.push(context,
                               MaterialPageRoute(builder: (context) => Twitter())),
                           icon: const FaIcon(FontAwesomeIcons.twitter, semanticLabel: "Twitter", size: 34, color: Colors.blue,)
                       ),
                       IconButton(
                           onPressed: () => Navigator.push(context,
                               MaterialPageRoute(builder: (context) => LinkedInLink())),
                           icon: const FaIcon(FontAwesomeIcons.linkedin, semanticLabel: "LinkedIn", size: 34, color: Colors.blueAccent,)
                       ),
                       IconButton(
                           onPressed: () => Navigator.push(context,
                               MaterialPageRoute(builder: (context) => XingLink())),
                           icon: const FaIcon(FontAwesomeIcons.xing, semanticLabel: "XING", size: 34, color: Colors.teal,)
                       ),
                     ],
                   )
                 ],
               ),
             ]
           ),
    );
  }
}
