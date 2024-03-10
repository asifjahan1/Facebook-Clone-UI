// import 'package:facebookclone/core/screens/error_screen.dart';
// import 'package:facebookclone/core/screens/loader.dart';
// import 'package:facebookclone/features/posts/models/post.dart';
// import 'package:facebookclone/features/posts/presentation/widgets/post_tile.dart';
// import 'package:facebookclone/features/posts/providers/get_all_videos_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class VideosScreen extends ConsumerWidget {
//   const VideosScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<Iterable<Post>> posts = ref.watch(getAllVideosProvider);

//     return posts.when(
//       data: (postsData) {
//         final postsList =
//             postsData.toList(); // Convert Iterable<Post> to List<Post>
//         return ListView.builder(
//           itemCount: postsList.length,
//           itemBuilder: (context, index) {
//             final post = postsList[index];
//             return PostTile(post: post);
//           },
//         );
//       },
//       loading: () {
//         return const Loader();
//       },
//       error: (error, stackTrace) {
//         return ErrorScreen(error: error.toString());
//       },
//     );
//   }
// }

// //
// //
// //

// // // older one

// // // import 'package:facebookclone/core/screens/error_screen.dart';
// // // import 'package:facebookclone/core/screens/loader.dart';
// // // import 'package:facebookclone/features/posts/presentation/widgets/post_tile.dart';
// // // import 'package:facebookclone/features/posts/providers/get_all_videos_provider.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';

// // // class VideosScreen extends ConsumerWidget {
// // //   const VideosScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context, WidgetRef ref) {
// // //     final posts = ref.watch(getAllVideosProvider);

// // //     return posts.when(
// // //       data: (postsList) {
// // //         return ListView.separated(
// // //           itemCount: postsList.length,
// // //           separatorBuilder: (context, index) => const SizedBox(height: 8),
// // //           itemBuilder: (context, index) {
// // //             final post = postsList.elementAt(index);
// // //             return PostTile(post: post);
// // //           },
// // //         );
// // //       },
// // //       error: (error, stackTrace) {
// // //         return ErrorScreen(error: error.toString());
// // //       },
// // //       loading: () {
// // //         return const Loader();
// // //       },
// // //     );
// // //   }
// // // }

// // import 'package:facebookclone/core/screens/error_screen.dart';
// // import 'package:facebookclone/core/screens/loader.dart';
// // import 'package:facebookclone/features/posts/models/post.dart';
// // import 'package:facebookclone/features/posts/presentation/widgets/post_tile.dart';
// // import 'package:facebookclone/features/posts/providers/get_all_videos_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';

// // class VideosScreen extends ConsumerWidget {
// //   const VideosScreen({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final AsyncValue<Iterable<Post>> posts = ref.watch(getAllVideosProvider);

// //     return posts.when(
// //       data: (postsData) {
// //         final postsList = postsData.toList();
// //         return ListView.builder(
// //           itemCount: postsList.length,
// //           itemBuilder: (context, index) {
// //             final post = postsList[index];
// //             return PostTile(post: post);
// //           },
// //         );
// //       },
// //       loading: () {
// //         return const Loader();
// //       },
// //       error: (error, stackTrace) {
// //         return ErrorScreen(error: error.toString());
// //       },
// //     );
// //   }
// // }
// //
// //
// //
// //
// //last updated

// // import 'package:facebookclone/core/screens/error_screen.dart';
// // import 'package:facebookclone/core/screens/loader.dart';
// // import 'package:facebookclone/features/posts/models/post.dart';
// // import 'package:facebookclone/features/posts/presentation/widgets/post_tile.dart';
// // import 'package:facebookclone/features/posts/providers/get_all_videos_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';

// // class VideosScreen extends ConsumerWidget {
// //   const VideosScreen({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     // Use AsyncValue<Iterable<Post>> for the provider
// //     final AsyncValue<Iterable<Post>> posts = ref.watch(getAllVideosProvider);

// //     return posts.when(
// //       data: (postsData) {
// //         // Filter out posts without the fileUrl property
// //         final videoPosts =
// //             postsData.where((post) => post.fileUrl.isNotEmpty).toList();
// //         return ListView.builder(
// //           itemCount: videoPosts.length,
// //           itemBuilder: (context, index) {
// //             final post = videoPosts[index];
// //             return PostTile(post: post);
// //           },
// //         );
// //       },
// //       loading: () {
// //         return const Loader();
// //       },
// //       error: (error, stackTrace) {
// //         return ErrorScreen(error: error.toString());
// //       },
// //     );
// //   }
// // }

// ignore_for_file: library_private_types_in_public_api

//
//
//
//
//Updated one
import 'package:facebookclone/core/constants/app_colors.dart';
import 'package:facebookclone/core/screens/error_screen.dart';
import 'package:facebookclone/core/screens/loader.dart';
import 'package:facebookclone/features/posts/models/post.dart';
import 'package:facebookclone/features/posts/presentation/screens/comments_screen.dart';
import 'package:facebookclone/features/posts/presentation/widgets/icon_text_button.dart';
import 'package:facebookclone/features/posts/providers/get_all_videos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WidgetRef ref, _) {
        final AsyncValue<Iterable<Post>> videoPosts =
            ref.watch(getAllVideosProvider);

        return videoPosts.when(
          data: (posts) {
            final recentVideoPosts = posts.where((post) {
              final difference =
                  DateTime.now().difference(post.createdAt).inDays;
              return difference <= 10 && post.postType == 'video';
            }).toList();

            if (recentVideoPosts.isNotEmpty) {
              return ListView.builder(
                itemCount: recentVideoPosts.length,
                itemBuilder: (context, index) {
                  final post = recentVideoPosts[index];
                  return VideoPostTile(post: post);
                },
              );
            } else {
              return const Center(
                child: Text('No recent video posts found'),
              );
            }
          },
          loading: () => const Loader(),
          error: (error, stackTrace) => ErrorScreen(error: error.toString()),
        );
      },
    );
  }
}

class VideoPostTile extends StatefulWidget {
  final Post post;

  const VideoPostTile({super.key, required this.post});

  @override
  _VideoPostTileState createState() => _VideoPostTileState();
}

class _VideoPostTileState extends State<VideoPostTile> {
  late VideoPlayerController _videoPlayerController;
  bool _isVideoPlayerInitialized = false;

  bool get isLiked => widget.post.likes.contains('currentUserId');

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer() async {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(widget.post.fileUrl);
    await _videoPlayerController.initialize();
    setState(() {
      _isVideoPlayerInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: Image.asset('assets/icons/me.png').image,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Asif Jahan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  if (_isVideoPlayerInitialized) {
                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                    setState(() {}); // Trigger a rebuild to update the icon
                  }
                },
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 25 / 16,
                      child: _isVideoPlayerInitialized
                          ? VideoPlayer(_videoPlayerController)
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                    ),
                    if (_isVideoPlayerInitialized)
                      Positioned.fill(
                        child: Center(
                          child: Visibility(
                            visible: !_videoPlayerController.value.isPlaying,
                            child: const Icon(
                              Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.post.content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconTextButton(
                      icon: isLiked
                          ? FontAwesomeIcons.solidThumbsUp
                          : FontAwesomeIcons.thumbsUp,
                      color:
                          isLiked ? AppColors.blueColor : AppColors.blackColor,
                      label: 'Like',
                      onPressed: () {},
                    ),
                    IconTextButton(
                      icon: FontAwesomeIcons.solidMessage,
                      label: 'Comment',
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          CommentsScreen.routeName,
                          arguments: widget.post.postId,
                        );
                      },
                    ),
                    IconTextButton(
                      icon: FontAwesomeIcons.share,
                      label: 'Share',
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              const Divider(
                color: Colors.grey,
                thickness: 10.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
