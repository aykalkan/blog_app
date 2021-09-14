import 'package:blog_app/controllers/general_controller.dart';
import 'package:blog_app/models/categories.dart';
import 'package:blog_app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GeneralController controller = Get.put(GeneralController());

    Post post = Get.arguments;
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
                  post.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 17,
                  left: 30,
                  child: Chip(
                    label: Text(
                      post.category.name,
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUetqWKxw_yKx_rG80j-rBwapn-dmxVedugw&usqp=CAU",
                      ),
                    ),
                    title: Text(post.ownerId),
                    subtitle: Text("8th September 2021"),
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  Text(
                    post.content,
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF3B5998),
              child: IconButton(
                onPressed: () => null,
                icon: FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFC8232C),
              child: IconButton(
                onPressed: () => null,
                icon: FaIcon(
                  FontAwesomeIcons.pinterestP,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF1DA1F2),
              child: IconButton(
                onPressed: () => null,
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFEF951C),
              child: IconButton(
                onPressed: () => null,
                icon: FaIcon(
                  FontAwesomeIcons.solidThumbsUp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
