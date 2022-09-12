import 'package:flutter/material.dart';

// TabManager extends changeNotifier. this
// allows the object to provide change notifications to its listeners
class TabManager extends ChangeNotifier {
  // this keeps track of which tab the user tapped
  int selectedTab = 0;
  // modifies the current tab index
  void goToTab(index) {
    // stores the index of the new tab the user tapped
    selectedTab = index;
    // calls notifylisteners() to notify all widgets listening to this state
    notifyListeners();
  }

// sets selectedTab to the REcipes tab, which is at index 1
  void goToRecipes() {
    selectedTab = 1;
    // notifies all widgets listening to TabManager that Recipes is the selected
    // tab
    notifyListeners();
  }
}
