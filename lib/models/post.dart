import 'package:blog_app/models/categories.dart';

class Post {
  Post({
    this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.ownerId,
    required this.category,
    required this.readSpan,
  });

  String? id;
  late String title;
  late String content;
  late String imageUrl;
  late String ownerId;
  late Categories category;
  late int readSpan;

  Post.fromMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      switch (key) {
        case "title":
          title = value;
          break;
        case "content":
          content = value;
          break;
        case "imageUrl":
          imageUrl = value;
          break;
        case "ownerId":
          ownerId = value;
          break;
        case "category":
          category = getCategoryFromName(value);
          break;
        case "readSpan":
          readSpan = value;
          break;
        default:
      }
    });
  }

  static Categories getCategoryFromName(String name) {
    switch (name) {
      case "UX design":
        return Categories.uxDesign;
      case "Tools":
        return Categories.tools;
      case "Content":
        return Categories.content;
      default:
        return Categories.uxDesign;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "content": content,
      "imageUrl": imageUrl,
      "ownerId": ownerId,
      "category": category.name,
      "readSpan": readSpan,
    };
  }
}
