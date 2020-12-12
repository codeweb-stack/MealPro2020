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
    int id = args['id'];
    Color color = args['color'];
    return Scaffold(
      appBar: PreferredSize(
        child: Card(
          color: color,
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(16))),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
      ),
      body: Center(
        child: Text(
          id.toString(),
          style: TextStyle(color: Colors.grey, fontSize: 100),
        ),
      ),
    );
  }
}
