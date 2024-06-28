import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:course_hub/constants/constants.dart';
import 'package:course_hub/models/post.dart';
import 'package:course_hub/models/comment.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = true;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  PostProvider() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseURL/posts'));

      if (response.statusCode == 200) {
        final List<dynamic> postJson = json.decode(response.body);
        _posts = postJson.map((json) => Post.fromJson(json)).toList();
        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  Future<void> addPost(String content, String token) async {
    final response = await http.post(
      Uri.parse('$baseURL/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'content': content,
      }),
    );

    if (response.statusCode == 201) {
      final newPost = Post.fromJson(json.decode(response.body));
      _posts.insert(0, newPost); // Add the new post at the beginning
      notifyListeners();
      print("post is added successfully");
    } else {
      print('Failed to create post. Status code: ${response.statusCode}');
    }
  }

  Future<void> addComment(Post post, String content, String token) async {
    final response = await http.post(
      Uri.parse('$baseURL/comments/${post.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'postId': post.id,
        'content': content,
      }),
    );
    if (response.statusCode == 201) {

      // print(response.body);
      
      final newComment = Comment.fromJson(json.decode(response.body));
      post.comments.add(newComment);
      notifyListeners();
    } else {
      print('Failed to post comment. Status code: ${response.statusCode}');
    }
  }
}
