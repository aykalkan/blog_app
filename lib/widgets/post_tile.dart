import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key}) : super(key: key);

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
            title: Text("Tobias Van"),
            subtitle: Text("3 mins to read"),
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
                  "A look into collaborative wireframing process",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1552229633-cbbaf48ddd4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8Mzc4MjUxMHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=416&q=60",
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
