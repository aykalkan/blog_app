class User {
  User({
    this.id,
    required this.name,
    required this.email,
    this.photoUrl =
        "https://pbs.twimg.com/profile_images/1371947593979334662/bjzvbLb2_400x400.jpg",
    this.posts,
    this.favouritePosts,
  });

  User.fromJson(Map<String, dynamic> data, {String? id}) {
    this.id = id;
    this.name = data["name"];
    this.email = data["email"];
    this.photoUrl = data["photoUrl"];
    this.posts = data["posts"].cast<String>();
    this.favouritePosts = data["favouritePosts"].cast<String>();
  }

  late final String? id;
  late final String name;
  late final String email;
  late final String photoUrl;
  List<String>? posts = [];
  List<String>? favouritePosts = [];

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
