import 'package:flutter/material.dart';

class ChubbyElevatedButton extends StatelessWidget {
  ChubbyElevatedButton(this.text, {this.color, this.padding, Key? key}) : super(key: key);

  final String text;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: padding,
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
          primary: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
