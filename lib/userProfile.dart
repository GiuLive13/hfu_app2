import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        body:/* ListView(
          physics: BouncingScrollPhysics(),
          children: [

          ],
        )*/  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User: '),
            const SizedBox(height: 5),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              icon: Icon(Icons.arrow_back, size: 32),
              label: Text("Logout"),
              onPressed: () => FirebaseAuth.instance.signOut(),
            )
          ],
        )
    );
  }
}
/*
 Change password,
 Delete Account,
 Profilbild ?
 */