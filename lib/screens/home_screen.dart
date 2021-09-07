import 'package:blog_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Latest Feed",
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black)
          ),
          actions: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                return null;
              },
              elevation: 8,
              mini: true,
            ),
          ],
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) => PostTile(),
          separatorBuilder: (context, index) => Divider(),
        ));
  }
}
