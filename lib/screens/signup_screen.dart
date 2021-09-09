import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Create Account.",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              SizedBox(
                width: 70,
                child: Divider(
                  thickness: 5,
                  height: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SignupForm(),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?"),
          TextButton(
            onPressed: () {
              Get.off(() => LoginScreen());
            },
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
