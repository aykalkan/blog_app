import 'package:blog_app/services/collection_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostsService {
  final _collectionService = CollectionService(Collection.posts);

  get referance => _collectionService.referance;
  Stream<QuerySnapshot<Object?>> get docsStream =>
      _collectionService.getDocsStream();
  void postsStream() {
    docsStream.map(
      (event) {
        event.docChanges.map((documents){
          final data = documents.doc.data();
        });
      },
    );
  }
}
