// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:course_hub/models/post.dart';

class LikeDislikeButtons extends StatefulWidget {
  final Post post;

  const LikeDislikeButtons({required this.post, super.key});

  @override
  _LikeDislikeButtonsState createState() => _LikeDislikeButtonsState();
}

class _LikeDislikeButtonsState extends State<LikeDislikeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.thumb_up,
            color: widget.post.isLiked ? Colors.blue : Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setState(() {
              if (widget.post.isLiked) {
                widget.post.upvotes--;
              } else {
                widget.post.upvotes++;
                widget.post.downvotes = 0;
              }
              widget.post.isLiked = !widget.post.isLiked;
              widget.post.isDisliked = false;
            });
          },
        ),
        Text(
          '${widget.post.upvotes}',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: Icon(
            Icons.thumb_down,
            color: widget.post.isDisliked ? Colors.red : Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setState(() {
              if (widget.post.isDisliked) {
                widget.post.downvotes--;
              } else {
                widget.post.downvotes++;
                widget.post.upvotes = 0;
              }
              widget.post.isDisliked = !widget.post.isDisliked;
              widget.post.isLiked = false;
            });
          },
        ),
        Text(
          '${widget.post.downvotes}',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
