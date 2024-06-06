class Post {
  final String username;
  final String content;
  int upvotes;
  int downvotes;

  Post({
    required this.username,
    required this.content,
    this.upvotes = 0,
    this.downvotes = 0,
  });
}
