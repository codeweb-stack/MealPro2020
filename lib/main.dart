import 'package:MyMealsPro2020/screens/categories_screen.dart';
import 'package:MyMealsPro2020/screens/meals_detail_screen.dart';
import 'package:MyMealsPro2020/screens/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        elevation: 10,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.dangerous,
              size: 50,
              color: Colors.red,
            ),
            Text('Page Not Found!')
          ],
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMealsPro2020',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        scaffoldBackgroundColor: Color.fromRGBO(237, 242, 244, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(),
        MealsDetailScreen.routeName: (ctx) => MealsDetailScreen()
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Error());
      },
    );
  }
}
