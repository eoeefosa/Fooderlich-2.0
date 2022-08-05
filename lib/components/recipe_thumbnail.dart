import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';

import '../fooderlich_theme.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({super.key, required this.recipe});
  // create simpleRecipe parameter that helps configure my widget
  final SimpleRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      // create a container with 8point padding all around
      padding: const EdgeInsets.all(8.0),
      // add vertical layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset('${recipe.dishImage}', fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(height: 10),
          Text(recipe.title,
              maxLines: 1, style: Theme.of(context).textTheme.bodyText1),
          Text(recipe.duration, style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}
