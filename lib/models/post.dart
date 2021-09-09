class Post{
  Post({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.owner,
    required this.category,
    required this.readSpan,
    required this.createdAt,
  });

  final String title;
  final String content;
  final String imageUrl;
  final String owner;
  final String category;
  final int readSpan;
  final DateTime createdAt;
}