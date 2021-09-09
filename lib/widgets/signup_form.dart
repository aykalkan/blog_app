import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

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
            Container(
              padding: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  return null;
                },
                child: Text(
                  "Create Account",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
