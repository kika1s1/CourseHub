import 'package:flutter/material.dart';
import 'package:course_hub/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({required this.comment, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("@${comment.username}"),
      subtitle: Text(comment.content),
    );
  }
}
