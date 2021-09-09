import 'dart:html';

import 'package:blog_app/models/post.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {

    @override
  void onInit() { // called immediately after the widget is allocated memory
    _posts.bindStream(PostsService().docsStream);
    super.onInit();
  }

  RxList<Post> _posts = <Post>[].obs;

  get posts => _posts;

}