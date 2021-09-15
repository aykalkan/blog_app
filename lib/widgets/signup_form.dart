import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends GetWidget<AuthController> {
  SignupForm({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Create Password",
              ),
            ),
            ChubbyElevatedButton(
              "CREATE ACCOUNT",
              margin: EdgeInsets.only(top: 32),
              onPressed: () {
                try {
                controller.createUser(
                  _nameController.text,
                  _emailController.text,
                  _passwordController.text,
                );
                Get.offAll(() => HomeScreen());
                } catch (e) {
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
