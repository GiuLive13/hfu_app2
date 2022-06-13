import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/userController/utils.dart';

import '../main.dart';
import 'new_password.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Login",
            style: TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          padding: const EdgeInsets.only(top: 40),
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                0.1,
                0.9,
                1.3,
              ],
                  colors: [
                Colors.white,
                Colors.lightGreen.shade600,
                Colors.green.shade900,
              ])),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                  ))),
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "E-Mail",
                        hintStyle: TextStyle(color: Colors.blueGrey.shade400),
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
                        hintStyle: TextStyle(color: Colors.blueGrey.shade400),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                  ),
                ),
                const SizedBox(height: 18),
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
                const SizedBox(height: 13),
                GestureDetector(
                    child: Text('Passwort vergessen?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary)),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewPassword(),
                        ))
                ),
                const SizedBox(height: 13),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        text: 'Noch keinen Account? ',
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.clickSignIn,
                          text: 'Registrieren',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.primary))
                    ])),
              ],
            ),
          ),
        ));
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
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
