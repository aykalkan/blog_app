import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginForm extends GetWidget<AuthController> {
  LoginForm({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        // padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  return null;
                },
                child: Text(
                  "Forgot Password?",
                ),
                style: TextButton.styleFrom(primary: Colors.grey),
              ),
            ),
            ChubbyElevatedButton(
              "LOGIN",
              margin: EdgeInsets.only(top: 10),
              onPressed: ()async {
                try {
                  await controller.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                  Get.offAll(() => HomeScreen());
                } catch (e) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
