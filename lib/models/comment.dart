class Comment {
  final int id;
  final int userId;
  final String username;
  final String? userAvatar;
  final String text;
  final DateTime createdAt;
  final int likes;
  final int replies;
  final bool isLiked;

  Comment({
    required this.id,
    required this.userId,
    required this.username,
    this.userAvatar,
    required this.text,
    required this.createdAt,
    this.likes = 0,
    this.replies = 0,
    this.isLiked = false,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      userAvatar: json['userAvatar'],
      text: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
      likes: json['likes'] ?? 0,
      replies: json['replies'] ?? 0,
      isLiked: json['isLiked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'userAvatar': userAvatar,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes,
      'replies': replies,
      'isLiked': isLiked,
    };
  }
}
