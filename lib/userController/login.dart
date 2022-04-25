import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/userController/utils.dart';

import '../main.dart';

class LoginWidget extends StatefulWidget {
  final Function() clickSignIn;

  const LoginWidget({
    Key? key,
    required this.clickSignIn,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: formKey,
      child: Column(children: <Widget>[
        SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  )
              )
          ),
          child: TextField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                hintText: "E-Mail",
                hintStyle: TextStyle(color: Colors.blueGrey.shade200),
                border: InputBorder.none),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ))),
          child: TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            obscureText: _obscureText,
            decoration: InputDecoration(
                hintText: "Passwort",
                hintStyle: TextStyle(color: Colors.blueGrey.shade200),
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                )),
          ),
        ),
        SizedBox(height: 40),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.lock_open, size: 32),
          label: const Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: signIn,
        ),
        SizedBox(height: 24),
        RichText(
            text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                text: 'Noch kein Account? ',
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.clickSignIn,
                      text: 'Registrieren',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary))
                ]))
      ],
      ),
    ));
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
