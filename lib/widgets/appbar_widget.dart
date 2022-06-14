import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../dropdownDir/about.dart';
import '../dropdownDir/contact.dart';
import '../dropdownDir/settings.dart';

class CustomMainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomMainAppBar({Key? key}) : super(key: key);

  @override
  State<CustomMainAppBar> createState() => _CustomMainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}

class _CustomMainAppBarState extends State<CustomMainAppBar> {

  @override
  Widget build(BuildContext context) {
    return NewGradientAppBar(
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: const [
            0.3,
            0.4,
            1
          ],
          colors: [
            Colors.green.shade600,
            Colors.lightGreen.shade500,
            Colors.white30,
          ]),
      centerTitle: false,
      title: const Text(
        'HFU Mobile',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.menu_rounded),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    const Text('Settings      ', textAlign: TextAlign.left),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      color: Colors.black,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Settings())),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                  ],
                )),
            PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    const Text('Kontakt      ', textAlign: TextAlign.left),
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.mail),
                      color: Colors.black,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Contact())),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                  ],
                )),
            PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    const Text('About         ', textAlign: TextAlign.left),
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.announcement),
                      color: Colors.black,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutProject())),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                  ],
                )
            ),
          ],
          onSelected: (item) => _selectedItem(context, item),
        ),
      ],
    );
  }
  void _selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Settings()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Contact()));
        break;
      case 2:
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context) => const AboutProject()));
        break;
    }
  }
}
