import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.name,
    required this.email,
    this.photoUrl =
        "https://pbs.twimg.com/profile_images/1371947593979334662/bjzvbLb2_400x400.jpg",
    this.posts = const [],
    this.favouritePosts = const [],
  });

  User.fromDocumentSnapshot(DocumentSnapshot snapshot){
    this.name = snapshot["name"];
    this.email = snapshot["email"];
    this.photoUrl = snapshot["photoUrl"];
    this.posts = snapshot["posts"];
    this.favouritePosts = snapshot["favouritePosts"];
  }

  late final String name;
  late final String email;
  late final String photoUrl;
  late final List<String> posts;
  late final List<String> favouritePosts;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "photoUrl": photoUrl,
      "posts": posts,
      "favouritePosts": favouritePosts,
    };
  }
}
