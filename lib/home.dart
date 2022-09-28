import 'package:flutter/material.dart';
import 'screens/explore_screen.dart';
import 'screens/grocery_screen.dart';
import 'screens/recipes_screen.dart';
import 'models/models.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    const ExploreScreen(),
    RecipeScreens(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // wraps all the widget inside Consumer, when TabManager changes, the
    // widgets below it will rebuild
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          // display the correct page widget based on the current tab index
          body: IndexedStack(index: tabManager.selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context)
                //
                .textSelectionTheme
                .selectionColor,
            //sets the current index of buttom navigationBar
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              // calls manager.goToTab when the user taps a
              // different tab, to notify other widgets that
              // the index changed
              tabManager.goToTab(index);
            },
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }
}
