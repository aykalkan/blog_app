import 'package:blog_app/widgets/add_post_form.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a new post",
        ),
        toolbarHeight: 100,
      ),
      body: AddPostForm(),
    );
  }
}
