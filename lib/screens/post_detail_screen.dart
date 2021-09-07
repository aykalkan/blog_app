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
                controller.isFavourite ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  // TODO databaseden çek
                  "https://images.unsplash.com/photo-1552229633-cbbaf48ddd4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8Mzc4MjUxMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=416&q=60",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 17,
                  left: 30,
                  child: Chip(
                    label: Text(
                      //TODO databaseden çek
                      "UX DESIGN",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              child: Column(
                children: [
                  Text(
                    "A look into collaborative wireframing process", // TODO databaseden çek
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
