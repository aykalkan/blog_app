import 'package:flutter/material.dart';

class ChubbyElevatedButton extends StatelessWidget {
  ChubbyElevatedButton(
    this.text, {
    this.icon,
    this.color,
    this.margin,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final Icon? icon;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed ??
            () {
              return null;
            },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
