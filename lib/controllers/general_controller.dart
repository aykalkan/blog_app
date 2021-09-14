import 'package:blog_app/models/post.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {

    @override
  void onInit() { // called immediately after the widget is allocated memory
    PostsService().initPostsListener(this);
    super.onInit();
  }

  RxList<Post> posts = <Post>[].obs;

    var _isFavourite = false.obs;

  get isFavourite => _isFavourite.value;

  set isFavourite(value) => _isFavourite.value = value;

}