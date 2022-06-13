import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hfu_app2/userController/utils.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Passwort zurücksetzen",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
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
                  ]
              )
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          )
                      )
                  ),
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "E-Mail",
                        hintStyle: TextStyle(color: Colors.blueGrey.shade400),
                        border: InputBorder.none
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                              ? 'Inkorrekte E-Mail'
                              : null,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.mail, size: 32),
                  label: const Text(
                    'Absenden',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: resetPassword,
                ),
              ],
            ),
          ),
        ));
  }

  Future resetPassword() async {

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('E-Mail zum zurücksetzen wurde gesendet');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
