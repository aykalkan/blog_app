import 'package:blog_app/controllers/post_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostDetailController controller = Get.put(PostDetailController());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                controller.isFavourite = !controller.isFavourite;
              },
              icon: Obx(
                () => Icon(
                  controller.isFavourite
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  size: 30,
                ),
              ))
        ],
        toolbarHeight: 100,
      ),
    );
  }
}
