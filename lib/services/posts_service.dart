import 'package:blog_app/services/collection_service.dart';

class PostsService {
  final _collectionService = CollectionService(Collection.posts);

  get referance => _collectionService.referance;
  get docsStream => _collectionService.getDocsStream();
  
}
