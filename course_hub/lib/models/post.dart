import 'package:course_hub/models/comment.dart';

class Post {
  String id;
  String username;
  String content;
  bool isLiked;
  bool isDisliked;
  int upvotes;
  int downvotes;
  List<Comment> comments;

  Post({
    required this.id,
    required this.username,
    required this.content,
    required this.isLiked,
    required this.isDisliked,
    required this.upvotes,
    required this.downvotes,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      username: json['creator']['username'] ?? '',
      content: json['content'] ?? '',
      isLiked: json['isLiked'] ?? false,
      isDisliked: json['isDisliked'] ?? false,
      upvotes: json['upvotes'] ?? 0,
      downvotes: json['downvotes'] ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((commentJson) => Comment.fromJson(commentJson))
          .toList() ?? [],
    );
  }
}
