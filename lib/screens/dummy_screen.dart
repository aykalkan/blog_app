import 'package:blog_app/controllers/general_controller.dart';
import 'package:blog_app/models/categories.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/services/collection_service.dart';
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
                onPressed: () => PostsService().initPostsListener(_controller),
                child: Text("Run postsStream")),
            ElevatedButton(
              onPressed: () => PostsService().add(Post(
                title: "hulalup",
                content: "Unnecessary",
                imageUrl:
                    "https://c.tenor.com/KOwL-etspd8AAAAM/magic-shia-labeouf.gif",
                ownerId: "no-owner",
                category: Categories.tools,
                readSpan: 5,
              )),
              child: Text("Add uselesss post"),
            ),
            Obx(
              () {
                List<Text> texts = [];
                _controller.posts.forEach(
                  (post) {
                    texts.add(Text(post.id!));
                  },
                );
                return Column(children: [...texts,Text("ben burdayım")],);
              },
            ),
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
