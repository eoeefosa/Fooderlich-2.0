import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace add layout widgets
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          scrollDirection: Axis.vertical,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'No Groceries',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              child: const Text('Browse Recipes'),
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            )
          ],
        ),
      ),
    );
  }
}
