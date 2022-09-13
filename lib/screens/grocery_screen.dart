import 'package:flutter/material.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // returns a grocerymanager avaliable in the tree
          final manager = Provider.of<GroceryManager>(context, listen: false);
          // adds a new route to the stack of routes
          Navigator.push(
            context,
            // MaterialPageRoute replaces the entire screen with a
            //platform-specific transition. In Android, for example,
            // it slides upwards and fades in. In iOS, it slides
            //in from the right
            MaterialPageRoute(
              // Creates a new GroceryItemScreen within the route’s
              // builder callback
              builder: (context) => GroceryItemScreen(
                // onCreate defines what to do with the created item
                onCreate: (item) {
                  //addItem() adds new item to the list of items
                  manager.addItem(item);
                  // pop removes the top navigation route item,
// GroceryItemScreen, to show the list of grocery items
                  Navigator.pop(context);
                },
              ),
            ),
          );
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
