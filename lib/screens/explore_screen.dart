import 'package:flutter/material.dart';
import '../components/components.dart';
import '../api/mock_fooderlich_service.dart';
import 'package:fooderlich/models/models.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    // ignore: lines_longer_than_80_chars
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      print('i am at the buttom!');
    }
    // ignore: lines_longer_than_80_chars
    if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      print('i am at the top');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

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
              const SizedBox(height: 5),
              FriendPostListView(friendPost: snapshot.data?.friendPosts ?? []),
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
