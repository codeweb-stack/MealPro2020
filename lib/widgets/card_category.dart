import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final int id;
  final String title;
  final Color color;

  CardCategory({this.title, this.color, this.id});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/meals',
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: color.withAlpha(255),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
