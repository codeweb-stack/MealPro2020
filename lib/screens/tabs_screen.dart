import 'categories_screen.dart';
import 'favioute_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, Object>> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": Fav(), "title": "Fav"}
  ];
  int _selectedTab = 0;
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                _openDrawer();
              },
            ),
            title: Text(
              _pages[_selectedTab]["title"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            tileColor: Color.fromRGBO(253, 216, 84, 1),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Fav")
        ],
      ),
      body: _pages[_selectedTab]["page"],
    );
  }
}
