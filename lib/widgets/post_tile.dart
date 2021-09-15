import 'package:blog_app/models/post.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/screens/post_detail_screen.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostTile extends StatelessWidget {
  PostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService().getUserObjectById(post.ownerId),
        // future: FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(post.ownerId)
        //     .get(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // User user =
            // User.fromJson(snapshot.data!.data() as Map<String, dynamic>);
            User user = snapshot.data!;
            return InkWell(
              onTap: () {
                Get.to(() => PostDetailScreen(), arguments: post);
              },
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.photoUrl,
                      ),
                    ),
                    title: Text(user.name),
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
          } else
            return SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            );
        });
  }
}
