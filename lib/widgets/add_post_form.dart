import 'package:blog_app/models/categories.dart';
import 'package:blog_app/models/post.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/services/posts_service.dart';
import 'package:blog_app/widgets/categories_dropdown.dart';
import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:blog_app/widgets/numeric_step_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostForm extends StatelessWidget {
  AddPostForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _imageUrl = "";
  Categories? _category;
  int _readSpan = 0;
  String _content = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onChanged: (value) => _title = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Image URL",
              ),
              onChanged: (value) => _imageUrl = value,
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
              decoration: InputDecoration(
                labelText: "Content",
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (value) => _content = value,
            ),
            ChubbyElevatedButton(
              "ADD POST",
              margin: EdgeInsets.only(top: 32),
              onPressed: () {
                final post = Post(
                  title: _title,
                  content: _content,
                  imageUrl: _imageUrl,
                  ownerId: "4OCOzrOhJWKhBM4qmV7E",
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
