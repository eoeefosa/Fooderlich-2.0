import 'package:flutter/material.dart';
// Import the barrel files, component.dart and models.dart, so you can use data
// models and UI components.
import 'components.dart';
import 'package:fooderlich/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // TodayRecipeListView needs a list of recipes to display.
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Within build(), start by applying some padding.
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      // Add a Column to place widgets in a vertical layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// In the column, add a Text. This is the header for the Recipes of the Day
          Text('Recipes of the Day " ',
              style: Theme.of(context).textTheme.headline1),
          // Add a 16-point-tall SizedBox, to supply some padding
          const SizedBox(height: 16),
          // 7
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.grey,
          )
        ],
      ),
    );
  }
  // TODO: Add buildCard() widget here
}
