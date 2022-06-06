import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hfu_app2/userController/utils.dart';

import '../main.dart';

class SignUpWidget extends StatefulWidget {
  final Function() clickSignUp;

  const SignUpWidget({
    Key? key,
    required this.clickSignUp,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final sameValueController = TextEditingController();

  bool _obscureTextFirst = true;
  bool _obscureTextSecond = true;

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
            "Registrieren",
            style: TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          padding: const EdgeInsets.only(top: 30),
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
                const SizedBox(height: 9),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                  ))),
                  child: TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "E-Mail",
                          hintStyle: TextStyle(color: Colors.blueGrey.shade400),
                          border: InputBorder.none),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => email != null &&
                              !EmailValidator.validate(email)
                          ? 'Bitte die korrekte E-Mail-Schreibweise verwenden'
                          : null),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                  ))),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    obscureText: _obscureTextFirst,
                    decoration: InputDecoration(
                        hintText: "Passwort",
                        hintStyle: TextStyle(color: Colors.blueGrey.shade200),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureTextFirst = !_obscureTextFirst;
                            });
                          },
                          child: Icon(_obscureTextFirst
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Mindestens 6 Zeichen'
                        : null,
                  ),
                ),
                /* Container(                                        Passwort bestätigen fixen
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
              ))),
              child: TextFormField(
                controller: sameValueController,
                textInputAction: TextInputAction.done,
                obscureText: _obscureTextSecond,
                decoration: InputDecoration(
                    hintText: "Passwort bestätigen",
                    hintStyle: TextStyle(color: Colors.blueGrey.shade200),
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureTextSecond = !_obscureTextSecond;
                        });
                      },
                      child: Icon(
                          _obscureTextSecond ? Icons.visibility : Icons.visibility_off
                      ),
                    )
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6 && value != passwordController
                    ? 'Passwort muss übereinstimmen'
                    : null,
              ),
            ), */
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.account_circle, size: 32),
                  label: const Text(
                    'Registrieren',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: signUp,
                ),
                const SizedBox(height: 13),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        text: 'Account vorhanden? ',
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.clickSignUp,
                          text: 'Login',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.primary))
                    ]))
              ],
            ),
          ),
        ));
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
