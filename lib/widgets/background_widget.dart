import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
              ])
      ),
    );
  }
}
