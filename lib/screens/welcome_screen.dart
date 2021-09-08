import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/com-turkticaret-blogapp.appspot.com/o/welcome_1.png?alt=media&token=5078a49d-63b0-47ce-a477-cd4f47bcebba",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [ 0.7, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
