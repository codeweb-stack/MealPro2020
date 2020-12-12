import 'package:MyMealsPro2020/screens/categories_screen.dart';
import 'package:MyMealsPro2020/screens/meals_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMealsPro2020',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen()
      },
    );
  }
}
