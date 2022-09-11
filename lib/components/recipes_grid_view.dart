import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class RecipeGridView extends StatelessWidget {
  // a list of recipes to display in the grid

  const RecipeGridView({super.key, required this.recipes});
  final List<SimpleRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    // apply 16 point padding to the left,right and top
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      // create a GridView.builder which displays only the items visible
      // onscreen
      child:
          // ScrollController()
          GridView.builder(
        scrollDirection: Axis.vertical,
        // tell the grid view how many items will be in the grid
        itemCount: recipes.length,
        // add sliverGridDelegateWithFixedCrossAxisCount and set
        // the crossAxiscount to 2.That means that there will be
        // only 2 columnns
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipes: simpleRecipe);
        },
      ),
    );
  }
}
