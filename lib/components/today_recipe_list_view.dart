import 'package:flutter/material.dart';
// Import the barrel files, component.dart and models.dart, so you can use data
// models and UI components.
import 'components.dart';
import 'package:fooderlich/models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // TodayRecipeListView needs a list of recipes to display.
  final List<ExploreRecipe>? recipes;
  const TodayRecipeListView({super.key, required this.recipes});
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
          Text(
            'Recipes of the Day " ',
            style: Theme.of(context).textTheme.headline1,
          ),
          // Add a 16-point-tall SizedBox, to supply some padding
          const SizedBox(height: 16),
          // 7
          Container(
            height: 400,
            // changes the color from grey to transparent
            color: Colors.transparent,
            // creates a listview.seperated. remember this widget creates
            //2 indexedwidgetbuilders
            child: ListView.separated(
                // sets the scroll direction to the horizontal axis
                scrollDirection: Axis.horizontal,
                // sets the number of items in the list view
                itemCount: recipes!.length,
                // creates an item builder callback. which will go through
                //everytime in the list
                itemBuilder: (context, index) {
                  // gets the recipe for the current index and builds the card
                  final recipe = recipes![index];
                  return buildCard(recipe);
                },
// creates a seperatorbuilder callback, which will go through every item in
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                }),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('this card doesn\'t exist');
    }
  }
}
