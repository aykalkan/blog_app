import 'package:blog_app/controllers/general_controller.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/screens/add_post_screen.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Latest Feed",
          ),
          actions: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Get.to(() => AddPostScreen());
              },
              elevation: 8,
              mini: true,
            ),
          ],
          toolbarHeight: 100,
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          // backwardsCompatibility: false,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.transparent,
          // ),
        ),
      
      body: Obx(
        () {
          return ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => PostTile(),
            separatorBuilder: (context, index) => Divider(),
          );
        },
      ),
    );
  }
}
