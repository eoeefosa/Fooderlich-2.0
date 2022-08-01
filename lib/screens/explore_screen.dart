import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes;
          // TODO: Replace this with TodayRecipeListView
          return TodayRecipeListView(recipes: recipes);
        } else {
          // 6
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
