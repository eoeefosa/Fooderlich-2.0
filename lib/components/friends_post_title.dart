import 'components.dart';
import '../models/models.dart';
import 'package:flutter/material.dart';

class FriendPostTitle extends StatelessWidget {
  final Post post;
  FriendPostTitle({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Create a Row to arrange the widgets horizontally
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // The first element is a circular avatar, which displays the
        // image asset associated with the post.
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        // Apply a 16-point padding
        const SizedBox(width: 16),
        // Create Expanded, which makes the children fill the rest
        //of the container.
        Expanded(
            // Establish a Column to arrange the widgets vertically
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Create a Text to display your friend’s comments.
            Text(post.comment),
            // Create another Text to display the timestamp of a post.
            Text(
              '${post.timestamp} mins ago',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ))
      ],
    );
  }
}
