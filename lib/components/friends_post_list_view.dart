import 'components.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class FriendPostListView extends StatelessWidget {
  // FriendPostListView requires a list of Posts.
  final List<Post> friendPost;

  const FriendPostListView({super.key, required this.friendPost});

  @override
  Widget build(BuildContext context) {
    // Apply a left and right padding widget of 16 points
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      // Create a Column to position the Text followed by the
      // posts in a vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Create the Text widget header
          Text(
            'Social Chefs ! ',
            style: Theme.of(context).textTheme.headline1,
          ),
          // Apply a spacing of 16 points vertically
          const SizedBox(height: 16),
          // TODO Add PostLIstView here
          ListView.separated(
              itemCount: friendPost.length,
              itemBuilder: (context, index) {
                final post = friendPost[index];
                return FriendPostTitle(post: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              }),
          // create ListView.separated to display the posts
          // listView separated has 2 indexWidgetBuilder callbsacks
          ListView.separated(
            // since you're nesting 2 list views, its a good idea to set primary
            // to false. its let flutter know that it isn't the primary scroll
            primary: false,
            // neverScrollablescrollphysics creates scroll physic that
            // doest allow the user to scroll beyond the end of the list.
            physics: const NeverScrollableScrollPhysics(),
            // create a fixed length scrollable list of items
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPost.length,
            // for every item in the list create a friends post tile
            itemBuilder: ((context, index) {
              final post = friendPost[index];
              return FriendPostTitle(post: post);
            }),
            // for every item in the list create a sized box of 16 points
            separatorBuilder: ((context, index) {
              return const SizedBox(height: 16);
            }),
          ),
          // Leave some padding at the end of the list
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
