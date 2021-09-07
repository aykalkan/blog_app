import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarManager.setColor(Colors.transparent);    
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Feed"),
        actions: [
          FloatingActionButton(
            onPressed: () {
              return null;
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Text("item $index"),
      ),
    );
  }
}
