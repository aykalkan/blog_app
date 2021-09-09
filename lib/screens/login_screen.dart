import 'package:blog_app/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24).copyWith(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                "Welcome Back.",
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
            LoginForm(),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?"),
          TextButton(
            onPressed: () {
              return null;
            },
            child: Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
