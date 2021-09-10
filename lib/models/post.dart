class Post {
  Post({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.ownerId,
    required this.categoryId,
    required this.readSpan,
    required this.createdAt,
  });

  late String id;
  final String title;
  final String content;
  final String imageUrl;
  final String ownerId;
  final String categoryId;
  final int readSpan;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "content": content,
      "imageUrl": imageUrl,
      "ownerId": ownerId,
      "categoryId": categoryId,
      "readSpan": readSpan,
      "createdAt": createdAt,
    };
  }
}
