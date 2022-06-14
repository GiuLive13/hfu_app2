import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:hfu_app2/userController/login.dart';
import '../userController/new_password.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const keyDarkMode = 'key-dark-mode';
  static const keyLanguage = 'key-language';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: SettingsList(sections: [
            SettingsSection(
                title: const Text('App-Einstellungen'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language, color: Colors.blueGrey),
                    title: const Text("Sprache"),
                    value: const Text("Deutsch"),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (isDarkMode) {},
                    initialValue: true,
                    leading:
                    const Icon(Icons.format_paint, color: Colors.blueGrey),
                    title: const Text('Darkmode'),
                  ),
                ]),
            SettingsSection(title: const Text("Account"), tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading:  const Icon(Icons.login, color: Colors.green),
                title: const Text("Einloggen"),
                onPressed: (context) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginWidget(clickSignIn: () {}))),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Ausloggen"),
                onPressed: logOutUser,
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.password, color: Colors.blueGrey),
                title: const Text("Passwort ändern"),
                onPressed: (context) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewPassword())),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: const Text("Account löschen"),
                onPressed: deleteCurrentUser,
              ),
            ])
          ])
      );
  }

  deleteCurrentUser(BuildContext context) {
    //implement!
  }

 Future logOutUser(context) async{
  return showDialog(
       context: context,
       builder: (BuildContext context) =>  AlertDialog(
         title: const Text('Wirklich ausloggen?'),
         actions: [
           TextButton(
               onPressed: () {
                 FirebaseAuth.instance.signOut(); // Loggedin Abfrage
                 Navigator.of(context).pop();
               },
               child: const Text('Ja', style: TextStyle(
                 fontSize: 24
               ),)),
           TextButton(
               onPressed: () => Navigator.of(context).pop(),
               child: const Text('Nein', style: TextStyle(
                   fontSize: 24
               ),))
         ],
       )
   );
  }

}
