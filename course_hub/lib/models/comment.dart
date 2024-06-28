class Comment {
  String id;
  String username;
  String content;
  int upvote;
  int downvote;

  Comment({
    required this.id,
    required this.username,
    required this.content,
    required this.upvote,
    required this.downvote,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] ?? '',
      username: json['user']["username"] ?? '',
      content: json['content'] ?? '',
      upvote: json['upvote'] ?? 0,
      downvote: json['downvote'] ?? 0,
    );
  }
}
