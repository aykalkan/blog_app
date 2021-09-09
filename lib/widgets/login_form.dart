import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Full Name",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Create Password",
              ),
            ),
            ChubbyElevatedButton(
              "CREATE ACCOUNT",
              margin: EdgeInsets.only(top: 32),
            ),
          ],
        ),
      ),
    );
  }
}
