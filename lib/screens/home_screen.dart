import 'package:blog_app/controllers/posts_controller.dart';
import 'package:blog_app/screens/welcome_screen.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/screens/add_post_screen.dart';
import 'package:blog_app/widgets/post_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest Feed",
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
                Get.offAll(() => WelcomeScreen());
              },
              icon: Icon(Icons.logout)),
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
        () => ListView.separated(
          itemCount: _controller.posts.length,
          itemBuilder: (context, index) =>
              PostTile(post: _controller.posts[index]),
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}
