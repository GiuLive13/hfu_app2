import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hfu_app2/userController/login.dart';

import '../userController/new_password.dart';
import '../userController/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const keyDarkMode = 'key-dark-mode';
  static const keyLanguage = 'key-language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Einstellungen'),
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            SettingsGroup(
              title: 'Allgemein',
            //  titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w800),
              children: <Widget>[
                buildLanguage(),
                buildDarkMode(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SettingsGroup(
                title: 'Account',
               // titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w800),
                children: <Widget>[
                  buildLogIn(context),
                  buildLogOut(context),
                  buildChangePassword(context),
                  buildDeleteAccount(context),
                ])
          ],
        )));
  }

  Widget buildLanguage() => DropDownSettingsTile(
        title: 'Sprache',
        settingKey: keyLanguage,
        selected: 1,
        values: const <int, String>{
          1: 'Deutsch',
          2: 'English',
          3: 'Francais',
          4: 'Espanol',
          5: '中国人'
        },
        onChange: (language) {},
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        title: 'Dark Mode',
        settingKey: keyDarkMode,
        leading: const FaIcon(
          FontAwesomeIcons.solidMoon,
          color: Colors.grey,
        ),
        onChange: (_) {},
      );

  Widget buildLogIn(BuildContext context) => SimpleSettingsTile(
        title: 'Einloggen',
        subtitle: '',
        leading: const FaIcon(
          FontAwesomeIcons.arrowRightToBracket,
          color: Colors.green,
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginWidget(clickSignIn: () {}))),
      );

  Widget buildLogOut(BuildContext context) => SimpleSettingsTile(
        title: 'Ausloggen',
        subtitle: '',
        leading: const FaIcon(
          FontAwesomeIcons.arrowRightFromBracket,
          color: Colors.red,
        ),
        onTap: () => logOutUser(context),
      );

  Widget buildChangePassword(BuildContext context) => SimpleSettingsTile(
        title: 'Passwort ändern',
        subtitle: '',
        leading: const Icon(
          Icons.password_sharp,
          color: Colors.blueGrey,
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewPassword())),
      );

  Widget buildDeleteAccount(BuildContext context) => SimpleSettingsTile(
        title: 'Account löschen',
        subtitle: '',
        leading: const FaIcon(
          FontAwesomeIcons.trashCan,
          color: Colors.red,
        ),
        onTap: () => deleteCurrentUser(context),
      );

  Future logOutUser(context) async => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Wirklich ausloggen?'),
            actions: [
              TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut(); // Loggedin Abfrage
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Ja',
                    style: TextStyle(fontSize: 24),
                  )),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Nein',
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ));

  Future deleteCurrentUser(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Account wirklich löschen?'),
              actions: [
                TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.currentUser?.delete();
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.email)
                          .delete();
                      Navigator.of(context).pop();
                      Utils.showSnackBar('Account gelöscht');
                    },
                    child: const Text(
                      'Ja',
                      style: TextStyle(fontSize: 24),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Nein',
                      style: TextStyle(fontSize: 24),
                    ))
              ],
            ));
  }
}
