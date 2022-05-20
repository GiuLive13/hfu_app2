import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/userController/authPage.dart';
import '../userProfile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Fehler aufgetreten"));
              } else if (snapshot.hasData) {
                return UserProfile();
              } else {
                return AuthPage();
              }
            }
            )
    );
  }
}

/*
 Change password,
 Delete Account,
 Profilbild ?
 */
