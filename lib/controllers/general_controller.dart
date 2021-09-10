import 'package:blog_app/models/post.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {

    @override
  void onInit() { // called immediately after the widget is allocated memory
    // _posts.bindStream(PostsService().postsStream());
    super.onInit();
  }

  RxList<Post> posts = <Post>[].obs;

}