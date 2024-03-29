import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({super.key, required this.recipes});
  // create simpleRecipe parameter that helps configure my widget
  final SimpleRecipe recipes;

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
              child: Image.asset(
                '${recipes.dishImage}',
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            recipes.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipes.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
