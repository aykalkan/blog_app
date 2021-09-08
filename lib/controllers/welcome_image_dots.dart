import 'package:flutter/material.dart';

class WelcomeImageDots extends StatelessWidget {
  const WelcomeImageDots({this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: IconButton(
        padding: EdgeInsets.all(0),
        iconSize: 10,
        onPressed: () {
          return null;
        },
        icon: Icon(isSelected ?
          Icons.circle: Icons.circle_outlined,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
