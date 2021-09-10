import 'package:blog_app/models/categories.dart';

class Post {
  Post({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.ownerId,
    required this.category,
    required this.readSpan,
    required this.createdAt,
  });

  late String id;
  final String title;
  final String content;
  final String imageUrl;
  final String ownerId;
  final Categories category;
  final int readSpan;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "content": content,
      "imageUrl": imageUrl,
      "ownerId": ownerId,
      "category": category,
      "readSpan": readSpan,
      "createdAt": createdAt,
    };
  }
}
