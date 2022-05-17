import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:hfu_app2/userController/login.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('App-Einstellungen'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                      leading: const Icon(Icons.language, color: Colors.blueGrey),
                      title: const Text("Sprache"),
                      value: const Text("Deutsch"),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {
                      // Darkmode
                    },
                    initialValue: true,
                    leading: const Icon(Icons.format_paint, color: Colors.blueGrey),
                    title: const Text('Darkmode'),
                  ),
                ]
            ),
          SettingsSection(
            title: const Text("Account"),
              tiles: <SettingsTile> [
                SettingsTile.navigation(
                  leading: const Icon(Icons.login, color: Colors.green),
                  title: const Text("Einloggen"),
                  onPressed: (context) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWidget(clickSignIn: () {  })
                      )
                  ),
                ),
                SettingsTile.navigation(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Ausloggen"),
                    onPressed: (context) => FirebaseAuth.instance.signOut(),
                ),
                SettingsTile.navigation(
                    leading: const Icon(Icons.password, color: Colors.blueGrey),
                    title: const Text("Passwort ändern")
                ),
                SettingsTile.navigation(
                    leading: const Icon(Icons.delete_forever, color: Colors.red),
                    title: const Text("Account löschen")
                ),
              ])
          ])
    );
  }
}

