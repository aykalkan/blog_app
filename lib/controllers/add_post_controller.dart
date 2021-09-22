import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  AddPostController(this.imageFocusNode, this.imageUrlController);

  @override
  void onInit() {
    imageFocusNode.addListener(() {
      imageUrl = imageUrlController.text;
      if (!imageFocusNode.hasFocus) setImageBox();
    });
    super.onInit();
  }

  final _imageUrl = "".obs;
  final Rx<Widget> _imageBox = Rx(Text("NO IMAGE"));

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FocusNode imageFocusNode;
  final TextEditingController imageUrlController;

  String get imageUrl => _imageUrl.value;
  Widget get imageBox => _imageBox.value;

  set imageUrl(value) => _imageUrl.value = value;
  set imageBox(Widget value) => _imageBox.value = value;

  void setImageBox({File? file}) {
    if (file != null) {
      imageBox = Image.file(file);
    } else if (_imageUrl.isEmpty) {
      imageBox = Text("NO IMAGE");
    } else {
      imageBox = getImageFromUrl();
    }
  }

  Widget getImageFromUrl() {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, error, __) => Text("INVALID IMAGE URL!!!"),
    );
  }

  Future<void> takeImage() async {
    ImagePicker picker = ImagePicker();

    final XFile? imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      imageQuality: 70,
    );

    if (imageFile != null) {
      setImageBox(file: File(imageFile.path));
      imageUrlController.text =
          await uploadFile(imageFile.path, imageFile.name);
    }
  }

  Future<String> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      final TaskSnapshot uTask = await _storage
          .ref()
          .child("post_images")
          .child(fileName)
          .putFile(file);

      return uTask.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print("Photo upload error. Error message: $e");
      return "Photo upload error";
    }
  }
}
