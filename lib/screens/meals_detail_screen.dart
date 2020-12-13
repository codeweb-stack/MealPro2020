import 'dart:ui';

import 'package:MyMealsPro2020/data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealsDetailScreen extends StatefulWidget {
  static const routeName = '/meals-details';

  @override
  _MealsDetailScreenState createState() => _MealsDetailScreenState();
}

class _MealsDetailScreenState extends State<MealsDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar() {
    return TabBar(
      indicatorColor: Colors.black54,
      tabs: <Tab>[
        Tab(
          child: Text('Ingrident'),
          icon: Icon(
            Icons.food_bank,
            size: 30,
          ),
        ),
        Tab(
          child: Text('Steps'),
          icon: Icon(
            Icons.set_meal,
            size: 30,
          ),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  Widget buildContainer(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: child,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget ingridents(List<String> ingridentsInput) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            tileColor: Colors.blueGrey,
            // leading: Text(index.toString()),
            leading: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
            ),
            title: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ingridentsInput[index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: ingridentsInput.length,
    );
  }

  Widget steps(List<String> stepsInput) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            tileColor: Colors.blueGrey,
            // leading: Text(index.toString()),
            leading: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
            ),
            title: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  stepsInput[index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: stepsInput.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                mealDetail.title,
              ),
              bottom: makeTabBar(),
              snap: true,
              floating: true,
              pinned: true,
              stretch: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Image.network(
                  mealDetail.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // SliverList(
            SliverFillRemaining(
                child: makeTabBarView(<Widget>[
              ingridents(mealDetail.ingredients),
              steps(mealDetail.steps)
            ])),
          ],
        ),
      ),
    );
  }
}
