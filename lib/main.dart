import 'package:blog_app/controllers/bindings/auth_binding.dart';
import 'package:blog_app/screens/dummy_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:blog_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        ),
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                 ? WelcomeScreen()
                // ? DummyScreen()
                : Center(
                    child: Text("Loading"),
                  ),
      ),
    );
  }
}
