// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:course_hub/models/post.dart';
// import 'package:course_hub/models/comment.dart';
import 'package:course_hub/components/comment_item.dart';
import 'package:provider/provider.dart';
import 'package:course_hub/providers/post_provider.dart';

class CommentList extends StatefulWidget {
  final Post post;
  final String token;

  const CommentList({required this.post, required this.token, super.key});

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  final TextEditingController _commentController = TextEditingController();

  Future<void> _addComment() async {
    final String commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;
    // print(widget.post.id);
    try {
      final postProvider = Provider.of<PostProvider>(context, listen: false);
      await postProvider.addComment(widget.post, commentText, widget.token);
      _commentController.clear();
    } catch (e) {
      print('Error adding comment: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        final comments = widget.post.comments;

        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentItem(comment: comment);
              },
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Comment ....',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addComment,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
