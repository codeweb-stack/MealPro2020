import 'dart:ui';
import 'package:MyMealsPro2020/models/meal.dart';
import 'package:MyMealsPro2020/screens/meals_detail_screen.dart';
import 'package:flutter/material.dart';

class CardMeals extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int durations;
  final Complexity complexity;
  final Affordability affordability;
  CardMeals(
      {@required this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.durations,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Afforadable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  void mealDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealsDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          mealDetails(context);
        },
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule_rounded),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$durations time'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_outline_rounded),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$complexityText'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$affordabilityText'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
