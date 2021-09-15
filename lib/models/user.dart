class User {
  User({
    required this.name,
    required this.email,
    this.photoUrl =
        "https://pbs.twimg.com/profile_images/1371947593979334662/bjzvbLb2_400x400.jpg",
    this.posts = const [],
    this.favouritePosts = const [],
  });

  final String name;
  final String email;
  final String photoUrl;
  final List<String> posts;
  final List<String> favouritePosts;

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
