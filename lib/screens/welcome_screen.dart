import 'package:blog_app/controllers/welcome_image_dots.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.network(
            "https://firebasestorage.googleapis.com/v0/b/com-turkticaret-blogapp.appspot.com/o/Mask%20Group%205.png?alt=media&token=ebd838b2-4dfb-482a-bb03-7a0d7604a449",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                stops: [0.3, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "The Future of Photography & Unsplash",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUetqWKxw_yKx_rG80j-rBwapn-dmxVedugw&usqp=CAU",
                      ),
                    ),
                    title: Text(
                      "Tobias Van",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WelcomeImageDots(isSelected: true),
                      WelcomeImageDots(),
                      WelcomeImageDots(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => LoginScreen());
                            },
                            child: Text(
                              "LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(fontSize: 16),
                            ),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => SignupScreen());
                            },
                            child: Text(
                              "CREATE ACCOUNT",
                              style:
                                  Theme.of(context).textTheme.button!.copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
