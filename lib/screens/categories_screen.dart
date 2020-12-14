import 'package:MyMealsPro2020/data/dummy_data.dart';
import 'package:MyMealsPro2020/widgets/card_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 1.8),
      children: DUMMY_CATEGORIES
          .map((category) => CardCategory(
              title: category.title, color: category.color, id: category.id))
          .toList(),
    );
  }
}
