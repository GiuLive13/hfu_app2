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
        )*/  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('User: '),
              SizedBox(height: 5),
              Text(
                user.email!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.arrow_back, size: 32),
                label: Text("Logout"),
                onPressed: () => FirebaseAuth.instance.signOut(),
              )
            ],
          ),
        )
    );
  }
}
