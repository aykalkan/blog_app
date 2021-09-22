import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  AddPostController(FocusNode imageFocusNode) {
    this.imageFocusNode = imageFocusNode;
  }

  @override
  void onInit() {
    imageFocusNode.addListener(() {
      if (!imageFocusNode.hasFocus) setImageBox();
    });
    super.onInit();
  }

  final _imageUrl = "".obs;
  final _imageFocusNode = FocusNode().obs;
  final Rx<Widget> _imageBox = Rx(Text("NO IMAGE"));

  String get imageUrl => _imageUrl.value;
  FocusNode get imageFocusNode => _imageFocusNode.value;
  Widget get imageBox => _imageBox.value;

  set imageUrl(value) => _imageUrl.value = value;
  set imageFocusNode(value) => _imageFocusNode.value = value;
  set imageBox(Widget value) => _imageBox.value = value;

  void setImageBox() {
    if (_imageUrl.isEmpty) {
      imageBox = Text("NO IMAGE");
    } else {
      imageBox = getImage();
    }
  }

  Widget getImage() {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, error, __) => Text("INVALID IMAGE URL!!!"),
    );
  }

  void takeImage() async {
    ImagePicker picker = ImagePicker();

    final XFile? imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 2048,
    );
  }
}
