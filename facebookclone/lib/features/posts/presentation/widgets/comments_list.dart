// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:facebookclone/core/screens/error_screen.dart';
import 'package:facebookclone/core/screens/loader.dart';
import 'package:facebookclone/features/posts/presentation/widgets/comment_tile.dart';
import 'package:facebookclone/features/posts/providers/get_all_comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsList extends ConsumerWidget {
  const CommentsList({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(getAllCommentsProvider(postId));
    return Expanded(
      child: comments.when(
        data: (commentsList) {
          return ListView.builder(
            itemCount: commentsList.length,
            itemBuilder: (context, index) {
              final comment = commentsList.elementAt(index);
              return CommentTile(
                comment: comment,
              );
            },
          );
        },
        error: (error, stackTrace) {
          return ErrorScreen(error: error.toString());
        },
        loading: () {
          return const Loader();
        },
      ),
    );
  }
}
