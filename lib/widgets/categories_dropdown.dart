import 'package:blog_app/models/categories.dart';
import 'package:flutter/material.dart';

class CategoriesDropdown extends StatefulWidget {
  const CategoriesDropdown({Key? key}) : super(key: key);

  @override
  State<CategoriesDropdown> createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {
  Categories currentValue = Categories.uxDesign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<Categories>(
        value: currentValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Theme.of(context).primaryColor,
        ),
        onChanged: (Categories? newValue) {
          setState(() {
            currentValue = newValue!;
          });
        },
        items: Categories.values.map((category) {
          return DropdownMenuItem<Categories>(
            value: category,
            child: Text(
              category.name,
            ),
          );
        }).toList(),
      ),
    );
  }
}
