import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
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
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return GetMaterialApp(
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
            home: HomeScreen(),
          );
        else
          return Text("Loading");
      },
    );
  }
}
