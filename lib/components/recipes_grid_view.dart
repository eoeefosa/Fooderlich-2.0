import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'components.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  const RecipeGridView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipes: simpleRecipe);
        },
      ),
    );
  }
}
