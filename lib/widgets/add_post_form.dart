import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/widgets/categories_dropdown.dart';
import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:blog_app/widgets/numeric_step_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostForm extends StatelessWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Image URL",
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("Category"),
                ),
                CategoriesDropdown(),
              ],
            ),
            Row(
              children: [
                Text("Read span (mins)"),
                NumericStepButton(onChanged: (value) => null),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Content",
              ),
              keyboardType: TextInputType.multiline,
            ),
            ChubbyElevatedButton(
              "ADD POST",
              margin: EdgeInsets.only(top: 32),
              onPressed: () {
                Get.offAll(() => HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
