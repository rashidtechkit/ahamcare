class LikePostModel {
  final String reactionType;
  final String userId;
  final String postId;

  LikePostModel({
    required this.reactionType,
    required this.userId,
    required this.postId,
  });

  Map<String, dynamic> toJson() {
    return {
      'reactionType': reactionType,
      'postId': postId,
      'userId': userId,
    };
  }
}
