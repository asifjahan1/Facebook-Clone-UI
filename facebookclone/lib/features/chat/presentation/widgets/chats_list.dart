import 'package:facebookclone/core/screens/error_screen.dart';
import 'package:facebookclone/core/screens/loader.dart';
import 'package:facebookclone/features/chat/presentation/widgets/chat_tile.dart';
import 'package:facebookclone/features/chat/providers/get_all_chats_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsList extends ConsumerWidget {
  const ChatsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsList = ref.watch(getAllChatsProvider);
    final myUid = FirebaseAuth.instance.currentUser!.uid;

    return chatsList.when(
      data: (chats) {
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats.elementAt(index);
            //final userId = chat.members.firstWhere((userId) => userId != myUid);
            // final userId = chat.members.firstWhere(
            //   (userId) => userId != myUid,
            //   orElse: () => 'defaultUserId', // Provide a default value here
            // );

            final List<String> members =
                chat.members; // Ensure chat.members is not null
            final userId = members.firstWhere(
              (_) => true, // No condition, return the first non-null member
              orElse: () => 'defaultUserId', // Provide a default value here
            );

            return ChatTile(
              userId: userId,
              lastMessage: chat.lastMessage,
              lastMessageTs: chat.lastMessageTs,
              chatroomId: chat.chatroomId,
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
    );
  }
}
