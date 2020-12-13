import 'package:MyMealsPro2020/data/dummy_data.dart';
import 'package:MyMealsPro2020/widgets/card_meals.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals';
  // final int id;
  // final String title;
  // final Color color;
  // MealsScreen({this.id, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    String title = args['title'];
    String id = args['id'];
    Color color = args['color'];
    final categoryMeals =
        DUMMY_MEALS.where((meals) => meals.categories.contains(id)).toList();
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
                tileColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(30, 60))),
              ),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return CardMeals(
                id: categoryMeals[index].id,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                affordability: categoryMeals[index].affordability,
                durations: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
              );
            },
            itemCount: categoryMeals.length,
          )),
    );
  }
}
