import 'package:blog_app/controllers/general_controller.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/services/collection_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsService {
  final _collectionService = CollectionService(Collection.posts);

  get referance => _collectionService.referance;

  Stream<QuerySnapshot<Object?>> get docsStream =>
      _collectionService.getDocsStream();

  void initPostsListener(GeneralController controller) {
    docsStream.listen(
      (event) {
        event.docChanges.forEach((element) async {
          final data = await element.doc.reference.get();
          final id = data.id;

          if (element.type == DocumentChangeType.added) {
            Post post = Post(
              title: data["title"],
              content: data["content"],
              imageUrl: data["imageUrl"],
              ownerId: data["ownerId"],
              category: Post.getCategoryFromName(data["category"]),
              readSpan: data["readSpan"],
              id: id,
            );
            controller.posts.add(post);
            print("Post created with id ${post.id}");
          }
          if (element.type == DocumentChangeType.removed) {
            controller.posts.removeWhere((post) => post.id == id);
            print("Post removed with id $id");
          }
        });
      },
    );
  }

  void add(Post post) async {
    final document = await _collectionService.add(post.toMap());
    post.id = document.id;
  }
}
