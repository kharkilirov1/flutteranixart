import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/comment.dart';
import '../constants/app_colors.dart';

class CommentsList extends StatelessWidget {
  final List<Comment> comments;
  final Function(int) onLike;
  final Function(int) onReply;
  final Function(int) onAuthorTap;

  const CommentsList({
    super.key,
    required this.comments,
    required this.onLike,
    required this.onReply,
    required this.onAuthorTap,
  });

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const Center(
        child: Text(
          'Нет комментариев',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => onAuthorTap(comment.id),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: comment.userAvatar != null
                            ? NetworkImage(comment.userAvatar!)
                            : null,
                        child: comment.userAvatar == null
                            ? const Icon(Icons.person, size: 20)
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            timeago.format(comment.createdAt, locale: 'ru'),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(comment.text),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () => onLike(comment.id),
                      icon: Icon(
                        comment.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: comment.isLiked
                            ? AppColors.favorite
                            : AppColors.textSecondary,
                        size: 20,
                      ),
                      label: Text(
                        comment.likes.toString(),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => onReply(comment.id),
                      icon: const Icon(
                        Icons.reply,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                      label: Text(
                        comment.replies.toString(),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
