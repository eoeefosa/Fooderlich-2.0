import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use your mock service to call getExploreData(). This returns an
      // ExploreData object future
      future: mockService.getExploreData(),
      // Check the state of the future within the builder callback
      builder: (context, snapshot) {
        // Check if the future is complete
        if (snapshot.connectionState == ConnectionState.done) {
          // When the future is complete, return the primary ListView. This
          // holds an explicit list of children. In this scenario,
          // the primary ListView will hold the other two ListViews as children
          // TODO: Replace this with TodayRecipeListView
          return ListView(
            // Set the scroll direction to vertical, although that’s the
            // default value
            scrollDirection: Axis.vertical,
            children: [
              // The first item in children is TodayRecipeListView.
              //You pass in the list of todayRecipes from ExploreData
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              // Add a 16-point vertical space so the lists aren’t too close
              //to each other
              const SizedBox(height: 16),
              // TODO: replace this with friends post
              Container(
                height: 80,
                color: Colors.green,
              )
            ],
          );
        } else {
          //  If the future hasn’t finished loading yet,
          //show a circular progress indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
