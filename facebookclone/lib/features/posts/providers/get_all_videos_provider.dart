import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebookclone/core/constants/firebaes_collection_names.dart';
import 'package:facebookclone/core/constants/firebase_field_names.dart';
import 'package:facebookclone/features/posts/models/post.dart';
import 'package:facebookclone/features/posts/providers/get_all_posts_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart'; // Import rxdart package

final getAllVideosProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
  final controller = StreamController<Iterable<Post>>();

  // Get stream of video posts
  final videoStream = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.posts)
      .where(FirebaseFieldNames.postType, isEqualTo: 'video')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((postData) => Post.fromMap(postData.data())));

  // Get stream of all posts using maybeWhen
  final allPostsStream = ref
      .watch(getAllPostsProvider)
      .maybeWhen(data: (posts) => posts, orElse: () => <Post>[]);

  // Print the data received from getAllPostsProvider for debugging
  if (kDebugMode) {
    print('All posts: $allPostsStream');
  }

  // Combine both streams using Rx.combineLatest2
  final combinedStream = Rx.combineLatest2(
    videoStream,
    Stream.value(allPostsStream),
    (Iterable<Post> videoPosts, Iterable<Post> allPosts) {
      // Merge and return the lists
      return [...videoPosts, ...allPosts];
    },
  );

  final sub = combinedStream.listen((posts) {
    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});






//
// updated but new
// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:facebookclone/core/constants/firebaes_collection_names.dart';
// import 'package:facebookclone/core/constants/firebase_field_names.dart';
// import 'package:facebookclone/features/posts/models/post.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getAllVideosProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) {
//   final controller = StreamController<Iterable<Post>>();

//   final sub = FirebaseFirestore.instance
//       .collection(FirebaseCollectionNames.posts)
//       .where(FirebaseFieldNames.postType, isEqualTo: 'video')
//       .orderBy(FirebaseFieldNames.datePublished, descending: true)
//       .snapshots()
//       .listen((snapshot) {
//     final posts = snapshot.docs.map(
//       (postData) => Post.fromMap(
//         postData.data(),
//       ),
//     );
//     controller.sink.add(posts);
//   });

//   ref.onDispose(() {
//     sub.cancel();
//     controller.close();
//   });

//   return controller.stream;
// });
