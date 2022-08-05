import '../components/components.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class RecipeScreens extends StatelessWidget {
  // create a mock service
  final ExplorerSevice = MockFooderlichService();
  RecipeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // create a FutureBuilder
    return FutureBuilder(
      // Use getRecipes() to return the list of recipes to display
      // this function returns a future list of SimpleRecipes
      future: ExplorerSevice.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        // check if the future is complete
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipeGridView(recipes: snapshot.data ?? []);
        } else {
          // show a circular loading indicator if the future isnt complete yet
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
