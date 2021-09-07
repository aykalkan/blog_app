import 'package:get/get.dart';

class PostDetailController extends GetxController {
  var _isFavourite = false.obs;

  get isFavourite => _isFavourite.value;

  set isFavourite(value) => _isFavourite.value = value;
}