class User {
  User({
    required this.name,
    required this.email,
    this.photo,
    this.posts = const [],
    this.favouritePosts = const [],
  });

  final String name;
  final String email;
  final String? photo;
  final List<String> posts;
  final List<String> favouritePosts;
}
