import 'package:flutter/material.dart';

class ChubbyElevatedButton extends StatelessWidget {
  ChubbyElevatedButton(this.text, {this.color, Key? key}) : super(key: key);

  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          return null;
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color == null ? Theme.of(context).primaryColor : color,
        ),
      ),
    );
  }
}
