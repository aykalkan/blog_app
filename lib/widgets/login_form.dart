import 'package:blog_app/widgets/chubby_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
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
              "CREATE ACCOUNT",
              icon: Icon(FontAwesomeIcons.twitter),
              margin: EdgeInsets.only(top: 32),
            ),
          ],
        ),
      ),
    );
  }
}
