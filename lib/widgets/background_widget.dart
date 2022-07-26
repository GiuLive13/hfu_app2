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
                0.0,
                0.9,
                1,
              ],
              colors: [
                Theme.of(context).canvasColor,
                Colors.lightGreen.shade800,
                Theme.of(context).colorScheme.primary
              ])
      ),
    );
  }
}
