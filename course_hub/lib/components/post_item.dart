// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:course_hub/models/post.dart';
import 'package:course_hub/components/comment_list.dart';
import 'package:course_hub/components/like_dislike_buttons.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final String token;

  const PostItem({required this.post, required this.token, super.key});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with SingleTickerProviderStateMixin {
  bool _showComments = false;

  void _toggleComments() {
    setState(() {
      _showComments = !_showComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.tertiary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "@${widget.post.username}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.post.content,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 10),
          LikeDislikeButtons(post: widget.post),
          GestureDetector(
            onTap: _toggleComments,
            child: Row(
              children: [
                Icon(
                  _showComments ? Icons.comment : Icons.comment_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 5),
                Text(
                  'Comments',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _showComments
                ? CommentList(post: widget.post, token: widget.token)
                : Container(),
          ),
        ],
      ),
    );
  }
}
