import 'package:flutter/material.dart';

import 'package:hfu_app2/userController/login.dart';
import 'package:hfu_app2/userController/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
        ? LoginWidget(clickSignIn: toggle)
        : SignUpWidget(clickSignUp: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}


