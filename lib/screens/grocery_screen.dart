import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO 11: PRESENT grocery item screen
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    // You wrap your widgets inside a Consumer, which listens for GroceryManager
// state changes.
    return Consumer<GroceryManager>(
      // Consumer rebuilds the widgets below itself when the grocery manager
      // items changes.
      builder: (context, manager, child) {
        // If there are grocery items in the list, show the GroceryListScreen.
        if (manager.groceryItem.isNotEmpty) {
          // TODO 25: add GroceryListScreen
          return Container();
        } else {
          // If there are no grocery items, show the EmptyGroceryScreen.
          return const EmptyGroceryScreen();
        }
      },
    );
  }
}
