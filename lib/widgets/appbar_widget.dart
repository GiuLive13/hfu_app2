import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../appbar/about.dart';
import '../appbar/contact.dart';
import '../appbar/settings_page.dart';

class CustomMainAppBar extends StatefulWidget implements PreferredSizeWidget {
        CustomMainAppBar({Key? key, required this.pageTitle}) : super(key: key);

  String pageTitle;

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
            1.3,
          ],
          colors: [
            Colors.green.shade600,
            Colors.lightGreen.shade300,
          ]),
      centerTitle: false,
      title: AutoSizeText(
        widget.pageTitle,
        maxFontSize: 30,
        minFontSize: 24,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: const Icon(Icons.menu_rounded),
          itemBuilder: (context) => [
             PopupMenuItem<int>(
                value: 0,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                    title: const Text('Settings'), trailing: Icon(Icons.settings, color: Theme.of(context).iconTheme.color,))),
             PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 8, right: 8),
                    title: const Text('Kontakt'), trailing: Icon(Icons.mail, color: Theme.of(context).iconTheme.color))),
             PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 8, right: 8),
                    title: const Text('About'), trailing: Icon(Icons.announcement, color: Theme.of(context).iconTheme.color))),
          ],
          onSelected: (item) => _selectedItem(context, item),
        ),
      ],
    );
  }

  void _selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SettingsPage()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Contact()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutProject()));
        break;
    }
  }
}
