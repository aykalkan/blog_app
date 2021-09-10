import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PostDetailScreen());
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUetqWKxw_yKx_rG80j-rBwapn-dmxVedugw&usqp=CAU",
              ),
            ),
            title: Text(post.ownerId),
            subtitle: Text("${post.readSpan} mins to read"),
            trailing: IconButton(
              onPressed: () {
                return null;
              },
              icon: Icon(Icons.more_vert),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 20,
            ),
            child: Column(
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  child: Image.network(
                    post.imageUrl,
                    height: 185,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
