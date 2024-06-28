// ignore_for_file: library_private_types_in_public_api

import 'package:course_hub/providers/post_provider.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:course_hub/constants/constants.dart';
import 'package:course_hub/components/post_item.dart';
// import 'package:course_hub/models/post.dart';
import 'package:provider/provider.dart';
class PostList extends StatelessWidget {
  final String token;

  const PostList({required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, child) {
        if (postProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: postProvider.posts.length,
          itemBuilder: (context, index) {
            return PostItem(post: postProvider.posts[index], token: token);
          },
        );
      },
    );
  }
}
