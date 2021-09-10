import 'package:flutter/material.dart';

enum Categories {
  uxDesign,
  tools,
  content,
}

extension CategoryExtension on Categories {
  Color get color {
    switch (this) {
      case Categories.uxDesign:
        return Colors.blue;
      case Categories.tools:
        return Colors.amber;
      case Categories.content:
        return Colors.teal;
      default:
        return Colors.white;
    }
  }

  String get name {
    switch (this) {
      case Categories.uxDesign:
        return "UX design";
      case Categories.tools:
        return "Tools";
      case Categories.content:
        return "Content";
      default:
        return "";
    }
  }
}