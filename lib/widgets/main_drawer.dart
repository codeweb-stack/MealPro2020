import 'package:flutter/material.dart';

Widget tile(String title, IconData icon) {
  return InkWell(
    child: ListTile(
      title: Text(title,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          )),
      leading: Icon(icon),
    ),
  );
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.amber),
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('My Meals',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.red)),
          ),
          tile('Meals', Icons.restaurant_menu_rounded),
          tile('Filter', Icons.filter_1_rounded)
        ],
      ),
    );
  }
}
