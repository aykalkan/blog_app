import 'dart:html';

import 'package:blog_app/models/post.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  RxList<Post> _posts = <Post>[].obs;

  get posts => _posts;

  set posts(value) => _posts.value = value;
  
}