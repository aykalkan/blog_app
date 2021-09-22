import 'package:blog_app/controllers/add_post_controller.dart';
import 'package:blog_app/models/categories.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/widgets/categories_dropdown.dart';
import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:blog_app/widgets/numeric_step_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostForm extends StatelessWidget {
  AddPostForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _imageController = TextEditingController();
  final _contentController = TextEditingController();
  final _imageFocus = FocusNode();
  Categories? _category;
  int _readSpan = 0;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AddPostController(_imageFocus,_imageController));

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _imageController,
                    focusNode: _imageFocus,
                    decoration: InputDecoration(
                      labelText: "Image URL",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    child:  Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      _controller.takeImage();
                    },
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: _controller.isWaiting ? CircularProgressIndicator() : _controller.imageBox,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("Category"),
                ),
                CategoriesDropdown(
                  onchanged: (value) => _category = value,
                ),
              ],
            ),
            Row(
              children: [
                Text("Read span (mins)"),
                NumericStepButton(onChanged: (value) => _readSpan = value),
              ],
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: "Content",
              ),
              keyboardType: TextInputType.multiline,
            ),
            ChubbyElevatedButton(
              "ADD POST",
              margin: EdgeInsets.only(top: 32),
              onPressed: () {
                final post = Post(
                  title: _titleController.text,
                  content: _contentController.text,
                  imageUrl: _imageController.text,
                  ownerId: FirebaseAuth.instance.currentUser!.uid,
                  category: _category!,
                  readSpan: _readSpan,
                );

                PostsService().add(post);

                Get.offAll(() => HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
