import 'package:blog_app/controllers/post_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Text(
                    "A look into collaborative wireframing process", // TODO databaseden çek
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUetqWKxw_yKx_rG80j-rBwapn-dmxVedugw&usqp=CAU",
                      ),
                    ),
                    title: Text("Tobias Van"),
                    subtitle: Text("8th September 2021"),
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  Text(
                    """Wireframing is a critical step in design—for you, for developers, for copywriters, and for anyone else who needs to understand your design. With all those people needing access, wouldn’t you want to work collaboratively from the get-go? 

Why bother making a wireframe collaboratively?

Well, for starters, collaborating lets you get feedback from your peers and stakeholders early on in the design process, keeping you from endless feedback cycles and helping you launch better designs faster.

Whether you’re sitting right next to someone or they’re halfway across the world, working sessions help foster creativity. Ideas are the gift that keeps on giving—one leads to another leads to another and, before you know it, you and your team are throwing creative calls back-and-forth like old pros.""",
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
