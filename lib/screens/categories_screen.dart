import 'package:MyMealsPro2020/data/dummy_data.dart';
import 'package:MyMealsPro2020/widgets/card_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Center(
                child: Text(
                  "My Meals",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              tileColor: Color.fromRGBO(253, 216, 84, 1),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
        ),
        body: GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 3 / 2),
          children: DUMMY_CATEGORIES
              .map((category) => CardCategory(
                  title: category.title,
                  color: category.color,
                  id: category.id))
              .toList(),
        ),
      ),
    );
  }
}
