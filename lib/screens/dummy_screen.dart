import 'package:blog_app/controllers/general_controller.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/screens/add_post_screen.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyScreen extends StatelessWidget {
  DummyScreen({Key? key}) : super(key: key);

  final _controller = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "--- DUMMY ---",
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => PostsService().postsStream(),
                child: Text("Run postsStream")),
            // ListView.separated(
            //   itemCount: 10,
            //   itemBuilder: (context, index) => PostTile(),
            //   separatorBuilder: (context, index) => Divider(),
            // ),
          ],
        ),
      ),
    );
  }
}
